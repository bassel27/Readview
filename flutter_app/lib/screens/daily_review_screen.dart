// TODO: card for title and author

import 'package:flutter/material.dart';
import '/components/bottom_buttons.dart';
import '../others/constants.dart';
import '../components/quoteCardsStack.dart';

class DailyReview extends StatelessWidget {
  static const route = '/dailyReview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            quoteCardsStack(),
            // bottomButtonsRow(widget.quoteCard),
          ],
        ),
      ),
    );
  }
}
