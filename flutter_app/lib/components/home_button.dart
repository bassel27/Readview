import 'package:flutter/material.dart';
import '../others/constants.dart';

class HomeButton extends StatelessWidget {
  final text; // final is required because this is a stateless widget whcih means that their properties must be set only once and can't be change after. Also, when you wnat to edit a stateless widget, you have to delete it and tehn build it once again
  final icon;
  final dynamic onPressed;
  final route;
  final red;
  final green;
  HomeButton(
      {this.text, this.onPressed, this.route, this.icon, this.red, this.green});
  //TODO: constants
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context,
              this.route); //onPressed is a required parameter (due to @required decoratorr) and it takes arguments of type void Callback (anonymous functions which don't have a name) which are functions that have no arguments and return no data
        },
        child: ListTile(
          // adds padding and space between icon and text// this is what makes the expanding effect of the button
          iconColor: Colors.white,
          textColor: Colors.white,
          leading: Icon(
            this.icon,
            size: kIconSize,
          ),
          title: Row(children: [
            SizedBox(width: 40),
            Text(
              this.text,
              style: kHomeButtonTextStyle,
            ),
          ]),
        ),
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
          primary: Color.fromARGB(255, this.red, this.green, 208),
          elevation: 0,
        ),
      ),
    );
  }
}
