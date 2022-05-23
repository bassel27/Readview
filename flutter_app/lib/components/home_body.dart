import 'package:flutter/material.dart';
import '../screens/daily_review_screen.dart';
import '../others/constants.dart';

class HomeBody extends StatelessWidget {
  static int red = 150;
  static int green = 180;
  void updateQuotes() {}
  void favorites() {}
  void browseByTheme() {}
  void browseByBook() {}
  void loadingScreen() {}
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(  //TODO: swipe up ffor search like whatsapp
        style: TextStyle(color: Colors.black),
        decoration: kTextFieldInputDecoration,
        onChanged: (value) {}, 
      ),
      HomeButton(
          "Daily Review", DailyReview, DailyReview.route, Icons.calendar_month),
      HomeButton("Update Quotes", loadingScreen, '', Icons.update),
      HomeButton("Favorites", favorites, '', Icons.favorite),
      HomeButton("Browse by Theme", browseByTheme, '', Icons.theater_comedy),
      HomeButton("Browse by Book", browseByBook, '', Icons.book),
    ]);
  }
}

class HomeButton extends StatelessWidget {
  final text; // final is required because this is a stateless widget whcih means that their properties must be set only once and can't be change after. Also, when you wnat to edit a stateless widget, you have to delete it and tehn build it once again
  final icon;
  final dynamic onPressed;
  final route;
  HomeButton(this.text, this.onPressed, this.route, this.icon);

  @override
  Widget build(BuildContext context) {
    HomeBody.red -= KSubtractAmount; // TODO: ask Deeb
    HomeBody.green -= KSubtractAmount;
    return Expanded(
        child: ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context,
            route); //onPressed is a required parameter (due to @required decoratorr) and it takes arguments of type void Callback (anonymous functions which don't have a name) which are functions that have no arguments and return no data
      },
      child: ListTile(
        // adds padding and space between icon and text// this is what makes the expanding effect of the button  //TODO: limit minimzing to the row width
        iconColor: Colors.white,
        textColor: Colors.white,

        leading: Icon(
          icon,
          size: kSizeIcon,
        ),
        title: Row(children: [
          SizedBox(width: 40),
          Text(
            text,
            style: kHomeButtonTextStyle,
          ),
        ]),
      ),
      style: ElevatedButton.styleFrom(
        //TODO: button doeesn't resize when screen is smaller
        primary: Color.fromARGB(255, HomeBody.red, HomeBody.green, 208),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        elevation: 0,
      ),
    ));
  }
}
