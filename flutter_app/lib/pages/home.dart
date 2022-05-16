import 'package:flutter/material.dart';
import '../services/daily_review_service.dart';

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

class HomeBody extends StatelessWidget {
  void updateQuotes() {}
  void favorites() {}
  void browseByTheme() {}
  void browseByBook() {}
  void loadingScreen() {}
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      HomeButton(
          "Daily Review", dailyReview, '/dailyReview', Icons.calendar_month),
      HomeButton("Update Quotes", loadingScreen, '', Icons.update),
      HomeButton("Favorites", favorites, '', Icons.favorite),
      HomeButton("Browse by Theme", browseByTheme, '', Icons.theater_comedy),
      HomeButton("Browse by Book", browseByBook, '', Icons.book),
    ]);
  }
}

var red = 150;
var green = 180;

class HomeButton extends StatelessWidget {
  static const sizeFont = 25.0;
  static const sizeIcon = 30.0;
  static const subtractAmount = 20;
  final text; // final is required because this is a stateless widget whcih means that their properties must be set only once and can't be change after. Also, when you wnat to edit a stateless widget, you have to delete it and tehn build it once again
  final icon;
  final Function onPressed;
  final route;
  HomeButton(this.text, this.onPressed, this.route, this.icon);

  @override
  Widget build(BuildContext context) {
    red -= subtractAmount; // TODO: ask Deeb
    green -= subtractAmount;
    return Expanded(
        child: ElevatedButton(
      onPressed: () {
        onPressed(context,
            route); //onPressed is a required parameter (due to @required decoratorr) and it takes arguments of type void Callback (anonymous functions which don't have a name) which are functions that have no arguments and return no data
      },
      child: ListTile(
        // adds padding and space between icon and text// this is what makes the expanding effect of the button  //TODO: limit minimzing to the row width
        iconColor: Colors.white,
        textColor: Colors.white,

        leading: Icon(
          icon,
          size: sizeIcon,
        ),
        title: Row(children: [
          SizedBox(width: 40),
          Text(
            text,
            style: TextStyle(
              fontSize: sizeFont,
              letterSpacing: 1.5,
            ),
          ),
        ]),
      ),
      style: ElevatedButton.styleFrom(
        //TODO: button doeesn't resize when screen is smaller
        primary: Color.fromARGB(255, red, green, 208),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        elevation: 0,
      ),
    ));
  }
}
