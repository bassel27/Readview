import 'package:flutter/material.dart';
import '/components/tts.dart';
import '../components/quoteCard.dart';
import '../others/constants.dart';

class DailyReview extends StatefulWidget {
  // when you change a stateless widget to a stateful widget, you have to restart

  @override
  State<DailyReview> createState() => _DailyReviewState();
}

class _DailyReviewState extends State<DailyReview> {
  @override
  Widget build(BuildContext context) {
    var quoteCard = QuoteCard();
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            quoteCard,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                      TTS tts = TTS(quoteCard.getCurrentQuote());
                      tts.speak();
                  },
                  child: Icon(Icons.hearing),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.favorite),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.delete),
                ),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
