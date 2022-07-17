import 'package:flutter/material.dart';
import 'package:readview_app/screens/review_screen.dart';
import '/screens/home_screen.dart';
import '/screens/loading_screen.dart';
import '/screens/browse_books_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // args from Navigator.pushnamed
    final args = settings.arguments;
    var page;
    switch (settings.name) {
      case HomeScreen.route:
        page = HomeScreen();
        break;
      // case ReviewScreen.route:
      //   page = ReviewScreen(args);
      //   break;
      case LoadingScreen.route:
        page = LoadingScreen(args);
        break;
      // case BrowseBooksScreen.route:
      //   if (args is List<String>) {
      //     page = BrowseBooksScreen(args);
      //   } else {
      //     return _errorRoute();
      //   }
      //   break;
      // default: // If there is no such named route in the switch statement
      //   return _errorRoute();
    }
    return MaterialPageRoute(builder: (_) => page);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
