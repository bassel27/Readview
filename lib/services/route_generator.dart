import 'package:flutter/material.dart';
import 'package:readview_app/screens/browse_books_screen.dart';
import 'package:readview_app/screens/review_screen.dart';
import '/screens/home_screen.dart';
import '/screens/loading_screen.dart';
import '/models/book.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // args from Navigator.pushnamed
    final args = settings.arguments;
    var page;
    switch (settings.name) {
      case HomeScreen.route:
        page = HomeScreen();
        break;
      case LoadingScreen.route:
        page = LoadingScreen();
        break;
      case ReviewScreen.route:
        if (args is List<Book>) {
          page = ReviewScreen(args);
        } else {
          return _errorRoute();
        }

        break;
      case BrowseScreen.route:
        page = BrowseScreen(args);
        break;
      default:
        return _errorRoute();
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
