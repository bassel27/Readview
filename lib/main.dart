// the main.dart file usually contains themes and directs to different screens
import 'package:flutter/material.dart';
import 'screens/daily_review_screen.dart';
import 'screens/home_screen.dart';
import 'screens/loading_screen.dart';
import 'screens/browse_books_screen.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: HomeScreen.route,
      routes: {
        HomeScreen.route: (context) =>
            HomeScreen(), // context: find a widget in the OVERALL widget tree
        DailyReview.route: (context) => DailyReview(),
        LoadingScreen.route: (context) => LoadingScreen(),
        BrowseBooksScreen.route: (context) => BrowseBooksScreen([]),
      },
    ),
  );
}
