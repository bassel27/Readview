import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import '../others/constants.dart';
import 'book.dart';

class quoteCardsStack extends StatefulWidget {
  @override
  State<quoteCardsStack> createState() => _quoteCardsStackState();
}

class _quoteCardsStackState extends State<quoteCardsStack> {
  List<swipeableQuoteCard> customCards = [];

  _quoteCardsStackState() {
    for (Book book in books) {
      for (String quote in book.quotes) {
        customCards.add(swipeableQuoteCard(book.title, book.author, quote));
      }
    }
    customCards.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: Stack(
        children: customCards,
      )),
    );
  }
}

class swipeableQuoteCard extends StatelessWidget {
  final quote;
  final author;
  final title;
  swipeableQuoteCard(this.title, this.author, this.quote);

  @override
  Widget build(BuildContext context) {
    return Swipable(
      child: Card(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Text(
                quote,
                style: kQuoteTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}





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