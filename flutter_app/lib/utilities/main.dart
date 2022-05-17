// the main.dart file usually contains themes and directs to different screens
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../pages/daily_review_screen.dart';
import '../screens/loading_screen.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) =>
            Home(), // context: find a widget in the OVERALL widget tree
        '/dailyReview': (context) => DailyReview(),
        '/loadingScreen': (context) => loadingScreen(),
      },
    ),
  );
}
