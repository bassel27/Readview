import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:readview_app/screens/home_screen.dart';
import '/others/constants.dart';
import '/services/network_helper.dart';
import '/models/book.dart';
import '/others/globals.dart';

class LoadingScreen extends StatelessWidget {
  static const route = '/';
  LoadingScreen();
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      splash: Lottie.asset('assets/GIFs/23707-book-animation-for-loader.json'),
      screenFunction: () async {
        booksGlobal = await NetworkHelper().getBooks();
        return HomeScreen();
      },
      backgroundColor: kLoadingScreenColor,
      splashIconSize: 300,
      centered: true,
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}
