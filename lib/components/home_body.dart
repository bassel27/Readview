import 'package:flutter/material.dart';
import 'package:readview_app/screens/browse_books_screen.dart';
import 'package:readview_app/screens/loading_screen.dart';
import 'package:readview_app/screens/loading_screen_2.dart';
import '../others/constants.dart';
import 'home_button.dart';

class HomeBody extends StatefulWidget {
  //TODO: widget for homebody?
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool isSearchVisisble = false;

  void updateQuotes() {}

  void favorites() {}

  void browseByTheme() {}

  void browseByBook() {}

  void loadingScreen() {}

  @override
  Widget build(BuildContext context) {
    int red = kInitialRedValue;
    int green = kInitialGreenValue;
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          // Swiping upwards  direction.
          if (details.delta.dy > 0) {
            isSearchVisisble = true;
          }

          // Swiping downwards.
          if (details.delta.dy < 0) {
            isSearchVisisble = false;
          }
        });
      },
      child: Column(children: [
        Visibility(
          visible: isSearchVisisble,
          child: TextField(
            style: kTextFieldTextStyle,
            decoration: kTextFieldInputDecoration,
            onChanged: (input) {},
          ),
        ),
        HomeButton(
            text: "Daily Review",
            route: LoadingScreen.route,
            icon: Icons.calendar_month,
            red: red -= KHomeButtonSubtractAmount,
            green: green -= KHomeButtonSubtractAmount),
        HomeButton(
            text: "Update Quotes",
            route: '',
            icon: Icons.update,
            red: red -= KHomeButtonSubtractAmount,
            green: green -= KHomeButtonSubtractAmount),
        HomeButton(
            text: "Favorites",
            route: '',
            icon: Icons.favorite,
            red: red -= KHomeButtonSubtractAmount,
            green: green -= KHomeButtonSubtractAmount),
        HomeButton(
            text: "Browse by Author",
            route: '',
            icon: Icons.book,
            red: red -= KHomeButtonSubtractAmount,
            green: green -= KHomeButtonSubtractAmount),
        HomeButton(
            text: "Browse by Book",
            route: LoadingScreen2.route,
            icon: Icons.book,
            red: red -= KHomeButtonSubtractAmount,
            green: green -= KHomeButtonSubtractAmount),
      ]),
    );
  }
}
