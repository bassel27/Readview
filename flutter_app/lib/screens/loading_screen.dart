import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:readview_app/screens/daily_review_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import '/components/book.dart';
import '/others/globals.dart';
import '/others/constants.dart';

class LoadingScreen extends StatelessWidget {
  static const route = '/loadingScreen';
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      splash: Lottie.asset('assets/23707-book-animation-for-loader.json'),
      screenFunction: () async {
        books = await Book.getBooks();
        // Navigator.pushNamed(context, DailyReview.route);
        return DailyReview();
      },
      backgroundColor: kLoadingScreenColor,
      splashIconSize: 250,
      centered: true,
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}
