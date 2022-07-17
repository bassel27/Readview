import 'package:flutter/material.dart';
import 'package:readview_app/components/swipeable_quote_card.dart';
import '../models/book.dart';
import 'swipeable_quote_card.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:readview_app/services/tts.dart';
import 'package:provider/provider.dart';
// Note that this package removes last element form the array with each swipe

class QuoteCardsStack extends StatelessWidget {
  static late List<SwipeableQuoteCard> _swipeableCards = [];
  final List<Book> books;

  QuoteCardsStack(this.books) {
    for (Book book in books) {
      for (String quote in book.quotes) {
        _swipeableCards.add(
          SwipeableQuoteCard(book.title, book.author, quote),
        );
      }
    }
    _swipeableCards.shuffle();
  }

  String getCurrentQuote() {
    return _swipeableCards[_swipeableCards.length - 1].quote;
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
    print(_swipeableCards.length);
    return Expanded(
      child: AppinioSwiper(
        maxAngle: 45,
        padding: EdgeInsets.fromLTRB(6, 6, 6, 15),
        cards: _swipeableCards,
        duration: Duration(milliseconds: 150),
        onSwipe: (index) {
          Provider.of<TTS>(context, listen: false).stop(); //TODO: await??
        },
      ),
    );
  }
}
