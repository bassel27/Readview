import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:readview_app/screens/review_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import '/others/constants.dart';

class LoadingScreen extends StatelessWidget {
  static const route = '/loadingScreen';
  final loadingScreenFunction;
  LoadingScreen(this.loadingScreenFunction);
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      splash: Lottie.asset('assets/23707-book-animation-for-loader.json'),
      screenFunction: this.loadingScreenFunction,
      backgroundColor: kLoadingScreenColor,
      splashIconSize: 250,
      centered: true,
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}
