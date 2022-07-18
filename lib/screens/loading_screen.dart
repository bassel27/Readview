import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:readview_app/screens/home_screen.dart';
import '/others/constants.dart';
import '/models/book.dart';
import '/others/globals.dart';
import 'package:readview_app/models/books_controller.dart';

class LoadingScreen extends StatelessWidget {
  static const route = '/';

  LoadingScreen();
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      splash: Lottie.asset('assets/GIFs/23707-book-animation-for-loader.json'),
      screenFunction: () async {
        booksGlobal = await Provider.of<BooksController>(context, listen: false)
            .fetchBookFromAPI();
        return HomeScreen();
      },
      backgroundColor: kLoadingScreenColor,
      splashIconSize: 300,
      centered: true,
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}
