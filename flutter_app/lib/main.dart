// the main.dart file usually contains themes and directs to different screens
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/daily_review_page.dart';
import 'pages/loading_screen.dart';

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
