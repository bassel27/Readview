import 'package:flutter/material.dart';

const kSizeFont = 25.0;
const kSizeIcon = 30.0;
const KSubtractAmount = 20;
const kScaffoldColor = Color.fromARGB(255, 111, 122, 174);
const kDrawerColor = Color.fromARGB(81, 14, 37, 244);
const kAppbarColor = Color.fromARGB(255, 68, 75, 105);
const kCardColor = Color.fromARGB(255, 241, 238, 238);
const int kInitialRedValue = 170;
const kInitialGreenValue = 200;
const kLoadingScreenColor = Color.fromARGB(255, 139, 207, 238);

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
  border: OutlineInputBorder(
    borderRadius: BorderRadius.zero,
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.zero,
  ),
  prefixIcon: Icon(
    Icons.search,
    color: Colors.white,
  ),
  filled: true,
  fillColor: kAppbarColor,
  hintText: "Search for a book, author or quote",
  hintStyle: TextStyle(color: Colors.white),
);

const kTextFieldTextStyle = TextStyle(color: Colors.white);