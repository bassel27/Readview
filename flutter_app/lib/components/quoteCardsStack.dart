import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:readview_app/services/tts.dart';
import '../others/constants.dart';
import 'book.dart';

class quoteCardsStack extends StatefulWidget {
  List<swipeableQuoteCard> swipeableCards = [];
  static var index = 0;

  quoteCardsStack() {
    index = 0;
    for (Book book in books) {
      for (String quote in book.quotes) {
        swipeableCards.add(
          swipeableQuoteCard(book.title, book.author, quote),
        );
      }
    }
    swipeableCards.shuffle();
  }

  String getCurrentQuote() {
    print(index);
    return swipeableCards[swipeableCards.length - index - 1].quote;
  }

  @override
  State<quoteCardsStack> createState() => _quoteCardsStackState();
}

class _quoteCardsStackState extends State<quoteCardsStack> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: Stack(
        children: widget.swipeableCards,
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
      verticalSwipe: false,
      onSwipeEnd: (position, details) {
        quoteCardsStack.index++;
        TTS.stop(); //TODO: await??
      },
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