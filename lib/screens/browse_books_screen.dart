import 'package:flutter/material.dart';

class BrowseBooksScreen extends StatefulWidget {
  final List<Card> booksCards;
  static const route = '/browseByBook';
  BrowseBooksScreen(this.booksCards);

  @override
  State<BrowseBooksScreen> createState() => _BrowseBooksScreenState();
}

class _BrowseBooksScreenState extends State<BrowseBooksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        // list view builder is dynamic (laods only what's visible)     //TODO: must be a stateful widget? //it rebuilds when the list updates
        itemBuilder: ((context, index) {
          return widget.booksCards[index];
        }),
        itemCount: widget.booksCards.length,
      ),
    );
  }
}
