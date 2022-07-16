import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:readview_app/screens/browse_books_screen.dart';
import 'package:readview_app/screens/daily_review_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:readview_app/services/network_helper.dart';
import '/others/globals.dart';
import '/others/constants.dart';

class LoadingScreen2 extends StatelessWidget {
  static const route = '/loadingScreen2';

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      splash: Lottie.asset('assets/23707-book-animation-for-loader.json'),
      screenFunction: () async {
        titles = await NetworkHelper().getTitles();
        return BrowseBooksScreen();
      },
      backgroundColor: kLoadingScreenColor,
      splashIconSize: 250,
      centered: true,
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}
