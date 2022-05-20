import 'package:flutter/material.dart';
import '/components/book.dart';
import '../others/constants.dart';

class QuoteCard extends StatefulWidget {
  late Book randomBook;
  late String quote;
  String getCurrentQuote() {
    return quote;
  }

  @override
  State<QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  @override
  Widget build(BuildContext context) {
    widget.randomBook =
        Book.getRandomBook(); // TODO: this causes change on hot reload
    widget.quote = widget.randomBook.getRandomQuote();
    return Expanded(
      child: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.velocity.pixelsPerSecond.dx < 1) {
            setState(() {});
          } else {
            setState(() {});
          }
        },
        child: Card(
          shape: RoundedRectangleBorder(
            side:
                BorderSide(color: Color.fromARGB(179, 135, 111, 111), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          //  shadowed rectangle and curved edges
          color: Color.fromARGB(255, 255, 255, 255),
          child: Padding(
            // the child of the padding widget is gonnna get a blanket around it
            padding: EdgeInsets.all(10),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.quote,
                  style: kQuoteTextStyle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
