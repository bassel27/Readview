import 'package:flutter/material.dart';
import 'package:readview_app/screens/loading_screen.dart';
import '../others/constants.dart';
import 'home_button.dart';

class HomeBody extends StatefulWidget {
  bool isSearchVisisble = false;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
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
            widget.isSearchVisisble = true;
          }

          // Swiping downwards.
          if (details.delta.dy < 0) {
            widget.isSearchVisisble = false;
          }
        });
      },
      child: Column(children: [
        Visibility(
          visible: widget.isSearchVisisble,
          child: TextField(
            style: kTextFieldTextStyle,
            decoration: kTextFieldInputDecoration,
            onChanged: (input) {},
          ),
        ),
        HomeButton(
            text: "Daily Review",
            onPressed: LoadingScreen,
            route: LoadingScreen.route,
            icon: Icons.calendar_month,
            red: red -= KSubtractAmount,
            green: green -= KSubtractAmount),
        HomeButton(
            text: "Update Quotes",
            onPressed: loadingScreen,
            route: '',
            icon: Icons.update,
            red: red -= KSubtractAmount,
            green: green -= KSubtractAmount),
        HomeButton(
            text: "Favorites",
            onPressed: favorites,
            route: '',
            icon: Icons.favorite,
            red: red -= KSubtractAmount,
            green: green -= KSubtractAmount),
        HomeButton(
            text: "Browse by Theme",
            onPressed: browseByTheme,
            route: '',
            icon: Icons.theater_comedy,
            red: red -= KSubtractAmount,
            green: green -= KSubtractAmount),
        HomeButton(
            text: "Browse by Book",
            onPressed: browseByBook,
            route: '',
            icon: Icons.book,
            red: red -= KSubtractAmount,
            green: green -= KSubtractAmount),
      ]),
    );
  }
}
