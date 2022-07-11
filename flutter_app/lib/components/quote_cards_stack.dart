import 'package:flutter/material.dart';
import 'package:readview_app/components/swipeable_quote_card.dart';
import 'book.dart';
import '/others/globals.dart';
import 'swipeable_quote_card.dart';

class QuoteCardsStack extends StatefulWidget {
  List<SwipeableQuoteCard> swipeableCards = [];
  static var index = 0;

  QuoteCardsStack() {
    index = 0;
    for (Book book in books) {
      for (String quote in book.quotes) {
        swipeableCards.add(
          SwipeableQuoteCard(book.title, book.author, quote),
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
  State<QuoteCardsStack> createState() => _QuoteCardsStackState();
}

class _QuoteCardsStackState extends State<QuoteCardsStack> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Stack(
          children: widget.swipeableCards,
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