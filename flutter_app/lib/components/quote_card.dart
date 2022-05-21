import 'package:flutter/material.dart';
import '/components/book.dart';
import '../others/constants.dart';
import 'quotes_stack.dart';

class QuoteCard extends StatefulWidget {
  Book randomBook = Book.getRandomBook();
  late String quote = randomBook.getRandomQuote();
  final mainStack = QuotesStack<String>();
  QuoteCard() {
    mainStack.push(quote);
  }
  final secondaryStack = QuotesStack<String>();
  String getCurrentQuote() {
    return quote;
  }

  void changeBookAndQuote() {
    randomBook = Book.getRandomBook();
    quote = randomBook.getRandomQuote();
  }

  @override
  State<QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  @override
  Widget build(BuildContext context) {
    widget.quote = widget.mainStack.peek;
    return Expanded(
      child: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.velocity.pixelsPerSecond.dx < 1) {
            //next
            setState(() {
              widget.changeBookAndQuote();
              if (widget.secondaryStack.isEmpty == true) {
                widget.mainStack.push(widget.quote);
              } else {
                while (widget.secondaryStack.isEmpty == false) {
                  widget.mainStack.push(widget.secondaryStack.pop());
                }
              }
            });
          } else {
            //prev
            setState(() {
              widget.secondaryStack.push(widget.mainStack.pop());
            });
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
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Text(
                    widget.quote,
                    style: kQuoteTextStyle,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
