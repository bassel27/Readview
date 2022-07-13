import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/components/bottom_buttons.dart';
import '../others/constants.dart';
import '../components/quote_cards_stack.dart';
import '/services/tts.dart';

class DailyReview extends StatefulWidget {
  static const route = '/loadingScreen/dailyReview';

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
        child: ChangeNotifierProvider<TTS>(
          create: (context) => TTS(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              quoteCardsstack,
              bottomButtonsRow(quoteCardsstack),
            ],
          ),
        ),
      ),
    );
  }
}
