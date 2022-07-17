import 'package:flutter/material.dart';
import 'package:readview_app/components/browse_button.dart';
import 'package:readview_app/components/home_button.dart';
import '/services/network_helper.dart';
import '/others/globals.dart';
import '/others/constants.dart';

class BrowseBooksScreen extends StatefulWidget {
  final List<String> titles;
  // final List<ListTile> booksTiles;
  static const route = '/browseByBook';
  // BrowseBooksScreen(this.booksTiles);
  BrowseBooksScreen(this.titles);

  @override
  State<BrowseBooksScreen> createState() => _BrowseBooksScreenState();
}

class _BrowseBooksScreenState extends State<BrowseBooksScreen> {
  List<BrowseButton> getBrowseButtonsList() {
    int red = kInitialRedValue;
    int green = kInitialGreenValue;
    List<BrowseButton> list = [];
    for (String title in widget.titles) {
      list.add(BrowseButton(
          text: title,
          route: 'review screen route',
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
