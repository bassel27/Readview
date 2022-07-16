import 'package:flutter/material.dart';
import '/services/network_helper.dart';
import '/others/globals.dart';

class BrowseBooksScreen extends StatefulWidget {
  // final List<ListTile> booksTiles;
  static const route = '/browseByBook';
  // BrowseBooksScreen(this.booksTiles);

  @override
  State<BrowseBooksScreen> createState() => _BrowseBooksScreenState();
}

class _BrowseBooksScreenState extends State<BrowseBooksScreen> {
  @override
  Widget build(BuildContext context) {
    print(titles);
    return Scaffold(
      body: ListView.builder(
        // list view builder is dynamic (laods only what's visible)     //TODO: must be a stateful widget? //it rebuilds when the list updates
        itemBuilder: ((context, index) {
          print(index);
          return ListTile(title: Text("lol"));
        }),
        itemCount: 3,
      ),
    );
  }
}
