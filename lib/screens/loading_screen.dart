import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:readview_app/screens/review_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:readview_app/services/network_helper.dart';
import '/models/book.dart';
import '/others/constants.dart';

class LoadingScreen extends StatelessWidget {
  static const route = '/loadingScreen';

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      splash: Lottie.asset('assets/23707-book-animation-for-loader.json'),
      screenFunction: () async {
        List<Book> books = await NetworkHelper().getBooks();
        // Navigator.pushNamed(context, DailyReview.route);
        return ReviewScreen(books);
      },
      backgroundColor: kLoadingScreenColor,
      splashIconSize: 250,
      centered: true,
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}
