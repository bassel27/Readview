import 'package:flutter/material.dart';

const kSizeFont = 25.0;
const kSizeIcon = 30.0;
const KSubtractAmount = 20;
const kScaffoldColor = Color.fromARGB(255, 111, 122, 174);
const kDrawerColor = Color.fromARGB(81, 14, 37, 244);
const kAppbarColor = Color.fromARGB(255, 68, 75, 105);
const kCardColor = Color.fromARGB(255, 241, 238, 238);

const TextStyle kQuoteTextStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 0.1);

const TextStyle kHomeButtonTextStyle = TextStyle(
  fontSize: kSizeFont,
  letterSpacing: 1.5,
);

RoundedRectangleBorder kCardRoundedRectangleBorder = RoundedRectangleBorder(
  side: BorderSide(color: Color.fromARGB(179, 135, 111, 111), width: 1),
  borderRadius: BorderRadius.circular(10),
);

InputDecoration kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: null,
  hintText: "🔎 Search",
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide.none,
  ),
);

const kTextFieldTextStyle = TextStyle(color: Colors.black);
