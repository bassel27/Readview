import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/components/bottom_buttons.dart';
import '../others/constants.dart';
import '../components/quote_cards_stack.dart';
import '/services/tts.dart';
import '/models/book.dart';

class ReviewScreen extends StatelessWidget {
  static const route = '/loadingScreen/dailyReview';
  final List<Book> books;
  ReviewScreen(this.books);

  @override
  Widget build(BuildContext context) {
    final quoteCardsstack = QuoteCardsStack(this.books); // TODO: use provider?
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
