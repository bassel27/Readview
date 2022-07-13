import 'package:flutter/material.dart';

class BrowseBooksScreen extends StatelessWidget {
  final List<Card> booksCards;
  static const route = '/browseByBook';
  BrowseBooksScreen(this.booksCards);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: this.booksCards,
      ),
    );
  }
}
