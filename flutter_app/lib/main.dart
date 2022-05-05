import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home:
          Home())); // the home property determines what's gonna show up on the home screen of the app
}

class Home extends StatelessWidget {
  //the _ before the class name means that it can't be used outside of this file

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 50, 56, 83),
      drawer: Drawer(
          child: Container(
        color: Color.fromARGB(81, 14, 37, 244),
      )),
      appBar: AppBar(
        toolbarHeight: 100,
        title: Image.asset('assets/Readview-logos_white.png'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 68, 75, 105),
        elevation: 0.0, // to prevent the dropshadow effect
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, //vertical in a column
        crossAxisAlignment: CrossAxisAlignment.stretch, //horizontal in a column
        children: getHomeButtonsList(),
      ),
    );
  }
}

Widget getButton(text, function, r, g, icon) {
  const sizeFont = 23.0;
  const sizeIcon = 30.0;
  return ElevatedButton(
    onPressed: function,
    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(icon, size: sizeIcon),
      SizedBox(width: 10),
      Text(text, style: TextStyle(fontSize: sizeFont)),
    ]),
    style: ElevatedButton.styleFrom(
        minimumSize: Size(200, 80), primary: Color.fromARGB(255, r, g, 208)),
  );
}

List<Widget> getHomeButtonsList() {
  int r = 150;
  int g = 180;
  const subtractAmount = 20;
  void updateQuotes() {}
  void dailyReview() {}
  void favorites() {}
  void browseByTheme() {}
  return [
    SizedBox(height: 20),
    getButton("Daily Review", dailyReview, r, g, Icons.calendar_month),
    getButton("Update Quotes", updateQuotes, r -= subtractAmount,
        g -= subtractAmount, Icons.update),
    getButton("Favorites", favorites, r -= subtractAmount, g -= subtractAmount,
        Icons.favorite),
    getButton("Browse by Theme", browseByTheme, r -= subtractAmount,
        g -= subtractAmount, Icons.theater_comedy),
  ];
}
