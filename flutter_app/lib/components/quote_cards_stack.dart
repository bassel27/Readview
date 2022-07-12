import 'package:flutter/material.dart';
import 'package:readview_app/components/swipeable_quote_card.dart';
import 'book.dart';
import '/others/globals.dart';
import 'swipeable_quote_card.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:readview_app/services/tts.dart';

class QuoteCardsStack extends StatefulWidget {
  final List<SwipeableQuoteCard> swipeableCards = [];
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
      child: AppinioSwiper(
        padding: EdgeInsets.fromLTRB(6, 6, 6, 15),
        cards: widget.swipeableCards,
        duration: Duration(milliseconds: 160),
        onSwipe: (index) {
          TTS.stop(); //TODO: await??
        },
      ),
    );
  }
}
