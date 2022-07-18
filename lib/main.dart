import 'package:flutter/material.dart';
import 'package:readview_app/screens/loading_screen.dart';
import 'screens/home_screen.dart';
import '/services/route_generator.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: LoadingScreen.route,
      onGenerateRoute: RouteGenerator.generateRoute,
      // routes: {
      //   HomeScreen.route: (context) =>
      //       HomeScreen(), // context: find a widget in the OVERALL widget tree
      // ReviewScreen.route: (context) => ReviewScreen(),
      // LoadingScreen.route: (context) => LoadingScreen(),
      // LoadingScreen2.route: (context) => LoadingScreen2(),
      // BrowseBooksScreen.route: (context) => BrowseBooksScreen(),
      // },
    ),
  );
}
