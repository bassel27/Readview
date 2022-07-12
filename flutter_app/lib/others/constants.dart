import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kSizeFont = 25.0;
const kIconSize = 30.0;
const KSubtractAmount = 20;
const kScaffoldColor = Color.fromARGB(255, 111, 122, 174);
const kDrawerColor = Color.fromARGB(81, 14, 37, 244);
const kAppbarColor = Color.fromARGB(255, 68, 75, 105);
const kCardColor = Color.fromARGB(255, 241, 238, 238);
const int kInitialRedValue = 170;
const kInitialGreenValue = 200;
const kLoadingScreenColor = Color.fromARGB(255, 139, 207, 238);

var kQuoteTextStyle = GoogleFonts.oswald(textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: 0.1));

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




// final mainStack = QuotesStack<String>();
  // QuoteCard() {
  //   mainStack.push(quote);
  // }
  // final secondaryStack = QuotesStack<String>();
  // String getCurrentQuote() {
  //   return quote;
  // }
    // void updateQuoteCard(bool isNext) {
  //   setState(() {
  //     if (isNext == true) {
  //       //next
  //       TTS.stop();
  //       widget.changeBookAndQuote();
  //       if (widget.secondaryStack.isEmpty == true) {
  //         widget.mainStack.push(widget.quote);
  //       } else {
  //         while (widget.secondaryStack.isEmpty == false) {
  //           widget.mainStack.push(widget.secondaryStack.pop());
  //         }
  //       }
  //     } else {
  //       //prev
  //       widget.secondaryStack.push(widget.mainStack.pop());
  //     }
  //   });
  // }