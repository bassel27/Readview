import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/components/bottom_buttons.dart';
import '../others/constants.dart';
import '../components/quote_cards_stack.dart';
import '/services/tts.dart';
import '/models/book.dart';
import '/others/globals.dart';

class ReviewScreen extends StatelessWidget {
  static const route = '/home_screen/daily_review';
  final List<Book> books = booksGlobal;
  // ReviewScreen(this.books);

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
