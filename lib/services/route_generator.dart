// import 'package:flutter/material.dart';
// import '/screens/daily_review_screen.dart';
// import '/screens/home_screen.dart';
// import '/screens/loading_screen.dart';
// import '/screens/browse_books_screen.dart';

// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     // args from Navigator.pushnamed
//     final args = settings.arguments;

//     switch (settings.name) {
//       case HomeScreen.route:
//         return MaterialPageRoute(
//           builder: (_) => HomeScreen(),
//         ); // context: find a widget in the OVERALL widget tree
//       case DailyReview.route:
//         return MaterialPageRoute(builder: (_) => DailyReview());
//       case LoadingScreen.route:
//         return MaterialPageRoute(builder: (_) => LoadingScreen());
//       case BrowseBooksScreen.route:
//         if (args is List<String>) {
//           return MaterialPageRoute(builder: (_) => BrowseBooksScreen(args));
//         }
//         return _errorRoute();
//       default:
//         // If there is no such named route in the switch statement
//         return _errorRoute();
//     }
//   }

//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(builder: (_) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Error'),
//         ),
//         body: Center(
//           child: Text('ERROR'),
//         ),
//       );
//     });
//   }
// }
