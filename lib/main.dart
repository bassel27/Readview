// the main.dart file usually contains themes and directs to different screens
import 'package:flutter/material.dart';
import 'package:readview_app/screens/loading_screen_2.dart';
import 'screens/daily_review_screen.dart';
import 'screens/home_screen.dart';
import 'screens/loading_screen.dart';
import 'screens/browse_books_screen.dart';
import '/services/route_generator.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: HomeScreen.route,
      onGenerateRoute: RouteGenerator.generateRoute,
      // routes: {
      //   HomeScreen.route: (context) =>
      //       HomeScreen(), // context: find a widget in the OVERALL widget tree
      //   DailyReview.route: (context) => DailyReview(),
      //   LoadingScreen.route: (context) => LoadingScreen(),
      //   LoadingScreen2.route: (context) => LoadingScreen2(),
      // BrowseBooksScreen.route: (context) => BrowseBooksScreen(),
      // },
    ),
  );
}
