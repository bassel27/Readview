import 'package:flutter/material.dart';
import 'package:readview_app/components/swipeable_quote_card.dart';
import '../models/book.dart';
import '/others/globals.dart';
import 'swipeable_quote_card.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:readview_app/services/tts.dart';
import 'package:provider/provider.dart';
// Note that this package removes last element form the array with each swipe

class QuoteCardsStack extends StatelessWidget {
  late List<SwipeableQuoteCard> swipeableCards = [];

  QuoteCardsStack() {
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
    return swipeableCards[swipeableCards.length - 1].quote;
  }
  //   with SingleTickerProviderStateMixin {
  // late AnimationController controller;

  // @override
  // void initState() {
  //   super.initState();
  //   controller = AnimationController(
  //       duration: Duration(seconds: 5),
  //       vsync:
  //           this); // this class acts like a ticker (required in vsync)  // this means reference the object of this class
  //   controller.forward(); // form 0 to 1 in default

  //   controller.addListener(() {
  //     setState(() {});
  //     // print(controller.value);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    print(swipeableCards.length);
    return Expanded(
      child: AppinioSwiper(
        padding: EdgeInsets.fromLTRB(6, 6, 6, 15),
        cards: swipeableCards,
        duration: Duration(milliseconds: 150),
        onSwipe: (index) {
          Provider.of<TTS>(context, listen: false).stop(); //TODO: await??
        },
      ),
    );
  }
}
