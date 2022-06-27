import 'package:flutter/material.dart';
import '../screens/daily_review_screen.dart';
import '../others/constants.dart';

class HomeBody extends StatefulWidget {
  bool isSearchVisisble = false;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  void updateQuotes() {}

  void favorites() {}

  void browseByTheme() {}

  void browseByBook() {}

  void loadingScreen() {}

  @override
  Widget build(BuildContext context) {
    int red = kInitialRedValue;
    int green = kInitialGreenValue;
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          // Swiping upwards  direction.
          if (details.delta.dy > 0) {
            widget.isSearchVisisble = true;
          }

          // Swiping downwards.
          if (details.delta.dy < 0) {
            widget.isSearchVisisble = false;
          }
        });
      },
      child: Column(children: [
        Visibility(
          visible: widget.isSearchVisisble,
          child: TextField(
            //TODO: swipe up ffor search like whatsapp
            style: kTextFieldTextStyle,
            decoration: kTextFieldInputDecoration,
            onChanged: (input) {},
          ),
        ),
        HomeButton(
            text: "Daily Review",
            onPressed: DailyReview,
            route: DailyReview.route,
            icon: Icons.calendar_month,
            red: red -= KSubtractAmount,
            green: green -= KSubtractAmount),
        HomeButton(
            text: "Update Quotes",
            onPressed: loadingScreen,
            route: '',
            icon: Icons.update,
            red: red -= KSubtractAmount,
            green: green -= KSubtractAmount),
        HomeButton(
            text: "Favorites",
            onPressed: favorites,
            route: '',
            icon: Icons.favorite,
            red: red -= KSubtractAmount,
            green: green -= KSubtractAmount),
        HomeButton(
            text: "Browse by Theme",
            onPressed: browseByTheme,
            route: '',
            icon: Icons.theater_comedy,
            red: red -= KSubtractAmount,
            green: green -= KSubtractAmount),
        HomeButton(
            text: "Browse by Book",
            onPressed: browseByBook,
            route: '',
            icon: Icons.book,
            red: red -= KSubtractAmount,
            green: green -= KSubtractAmount),
      ]),
    );
  }
}

class HomeButton extends StatelessWidget {
  final text; // final is required because this is a stateless widget whcih means that their properties must be set only once and can't be change after. Also, when you wnat to edit a stateless widget, you have to delete it and tehn build it once again
  final icon;
  final dynamic onPressed;
  final route;
  final red;
  final green;
  HomeButton(
      {this.text, this.onPressed, this.route, this.icon, this.red, this.green});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context,
            route); //onPressed is a required parameter (due to @required decoratorr) and it takes arguments of type void Callback (anonymous functions which don't have a name) which are functions that have no arguments and return no data
      },
      child: ListTile(
        // adds padding and space between icon and text// this is what makes the expanding effect of the button
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
        primary: Color.fromARGB(255, red, green, 208),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        elevation: 0,
      ),
    ));
  }
}
