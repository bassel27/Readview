import 'package:flutter/material.dart';
import 'package:readview_app/components/browse_button.dart';
import '/others/constants.dart';
import '/models/books_controller.dart';
import 'package:provider/provider.dart';
import 'package:readview_app/models/books_controller.dart';

class BrowseScreen extends StatelessWidget {
  static const route = '/home_screen/browseByBook';
  final titlesOrAuthors;
  BrowseScreen(this.titlesOrAuthors);
  List<BrowseButton> getBrowseButtonsList() {
    int red = kInitialRedValue;
    int green = kInitialGreenValue;
    List<BrowseButton> browseButtonsList = [];
    for (String title in this.titlesOrAuthors) {
      browseButtonsList.add(BrowseButton(
          text: title,
          red: red -= kBrowseButtonSubtractAmount,
          green: green -= kBrowseButtonSubtractAmount));
    }
    return browseButtonsList;
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
