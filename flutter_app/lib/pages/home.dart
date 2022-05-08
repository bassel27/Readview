import 'package:flutter/material.dart';
//import 'package:readview_app/pages/loading_screen.dart';
import '/services/daily_review.dart';

class Home extends StatelessWidget {
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
        body: HomeBody());
  }
}

class HomeButton extends StatelessWidget {
  static const sizeFont = 23.0;
  static const sizeIcon = 30.0;
  final text;
  final r;
  final g;
  final icon;
  final Function function;
  final route;
  HomeButton(this.text, this.function, this.route, this.r, this.g, this.icon);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        function(context, route);
      },
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(icon, size: sizeIcon),
        SizedBox(width: 10),
        Text(text, style: TextStyle(fontSize: sizeFont)),
      ]),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(200, 80),
        primary: Color.fromARGB(255, r, g, 208),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        elevation: 0,
      ),
    );
  }
}

//ignore: must_be_immutable
class HomeBody extends StatelessWidget {
  var r = 150;
  var g = 180;
  static const subtractAmount = 20;

  void updateQuotes() {}
  void favorites() {}
  void browseByTheme() {}
  void browseByBook() {}
  void loadingScreen() {}
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start, //vertical in a column
        crossAxisAlignment: CrossAxisAlignment.stretch, //horizontal in a column
        children: [
          HomeButton("Daily Review", dailyReview, '/dailyReview', r, g,
              Icons.calendar_month),
          HomeButton("Update Quotes", loadingScreen, '', r -= subtractAmount,
              g -= subtractAmount, Icons.update),
          HomeButton("Favorites", favorites, '', r -= subtractAmount,
              g -= subtractAmount, Icons.favorite),
          HomeButton("Browse by Theme", browseByTheme, '', r -= subtractAmount,
              g -= subtractAmount, Icons.theater_comedy),
          HomeButton("Browse by Book", browseByBook, '', r -= subtractAmount,
              g -= subtractAmount, Icons.book)
        ]);
  }
}
