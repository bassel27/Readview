import 'package:flutter/material.dart';
import 'package:readview_app/components/browse_button.dart';
import '/others/constants.dart';
import '/models/books_controller.dart';
import 'package:provider/provider.dart';
import 'package:readview_app/models/books_controller.dart';

class BrowseBooksScreen extends StatefulWidget {
  static const route = '/home_screen/browseByBook';
  // final List<ListTile> booksTiles;
  // BrowseBooksScreen(this.booksTiles);

  @override
  State<BrowseBooksScreen> createState() => _BrowseBooksScreenState();
}

class _BrowseBooksScreenState extends State<BrowseBooksScreen> {
  List<BrowseButton> getBrowseButtonsList() {
    int red = kInitialRedValue;
    int green = kInitialGreenValue;
    List<BrowseButton> list = [];
    for (String title
        in Provider.of<BooksController>(context, listen: false).writeTitles()) {
      list.add(BrowseButton(
          text: title,
          red: red -= kBrowseButtonSubtractAmount,
          green: green -= kBrowseButtonSubtractAmount));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: getBrowseButtonsList(),
      ),
    );
  }
}
