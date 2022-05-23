import 'package:flutter/material.dart';
import '/components/book.dart';
import '../others/constants.dart';
import 'quotes_stack.dart';
import '/services/tts.dart';

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
  void updateQuoteCard(var dxVelocity) {
    setState(() {
      if (dxVelocity < 1) {
        //next
        TTS.stop();
        widget.changeBookAndQuote();
        if (widget.secondaryStack.isEmpty == true) {
          widget.mainStack.push(widget.quote);
        } else {
          while (widget.secondaryStack.isEmpty == false) {
            widget.mainStack.push(widget.secondaryStack.pop());
          }
        }
      } else {
        //prev
        widget.secondaryStack.push(widget.mainStack.pop());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.quote = widget.mainStack.peek;
    return Expanded(
      child: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          updateQuoteCard(details.velocity.pixelsPerSecond.dx);
        },
        child: Card(
          shape:
              kCardRoundedRectangleBorder, //  shadowed rectangle and curved edges
          color: kCardColor,
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
    );
  }
}
