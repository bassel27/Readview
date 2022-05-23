// TODO: card for title and author

import 'package:flutter/material.dart';
import '../services/tts.dart';
import '../components/quote_card.dart';
import '../others/constants.dart';

class DailyReview extends StatefulWidget {
  // when you change a stateless widget to a stateful widget, you have to restart
  static const route = '/dailyReview';
  final quoteCard = QuoteCard();
  @override
  State<DailyReview> createState() => _DailyReviewState();
}

class _DailyReviewState extends State<DailyReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.quoteCard,
            buttomBottonsRow(widget.quoteCard),
          ],
        ),
      ),
    );
  }
}

class buttomBottonsRow extends StatelessWidget {
  final quoteCard;
  buttomBottonsRow(this.quoteCard);
  static late TTS tts;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.favorite),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            tts = TTS(quoteCard.getCurrentQuote());
            tts.speak();
          },
          child: Icon(Icons.hearing),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.edit),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.delete),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
