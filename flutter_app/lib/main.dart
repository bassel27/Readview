// the main.dart file usually contains themes and directs to different screens
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/daily_review_page.dart';
import 'pages/loading_screen.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/': (context) => Home(),
        '/dailyReview': (context) => DailyReview(),
        '/loadingScreen': (context) => loadingScreen(),
      },
    ),
  );
}
