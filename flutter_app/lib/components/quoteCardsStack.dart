import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import '../others/constants.dart';
import 'book.dart';

int index = 0;

class quoteCardsStack extends StatefulWidget {
  List<swipeableQuoteCard> swipeableCards = [];
  quoteCardsStack() {
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
    String quote = swipeableCards[swipeableCards.length - index - 1].quote;
    print(quote);
    return quote;
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

  swipeableQuoteCard(this.title, this.author, this.quote) {
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Swipable(
      onSwipeEnd: (position, details) {
        index++;
        print(index);
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