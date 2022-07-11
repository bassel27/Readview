// TODO: card for title and author

import 'package:flutter/material.dart';
import '/components/bottom_buttons.dart';
import '../others/constants.dart';
import '../components/quote_cards_stack.dart';

class DailyReview extends StatefulWidget {
  static const route =
      '/loadingScreen/dailyReview'; // so you can't change it by mistake

  @override
  State<DailyReview> createState() => _DailyReviewState();
}

class _DailyReviewState extends State<DailyReview> {
  final quoteCardsstack = QuoteCardsStack();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            quoteCardsstack,
            bottomButtonsRow(quoteCardsstack),
          ],
        ),
      ),
    );
  }
}
