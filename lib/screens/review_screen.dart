import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/components/bottom_buttons.dart';
import '../others/constants.dart';
import '../components/quote_cards_stack.dart';
import '/services/tts.dart';

class Review extends StatelessWidget {
  final quoteCardsstack = QuoteCardsStack();
  static const route = '/loadingScreen/dailyReview';
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
              BottomButtonsRow(quoteCardsstack),
            ],
          ),
        ),
      ),
    );
  }
}
