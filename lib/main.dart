import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readview_app/models/books_controller.dart';
import 'package:readview_app/screens/loading_screen.dart';

import '/services/route_generator.dart';

void main() {
  runApp(
    Provider<BooksController>(
      create: (context) => BooksController(),
      child: MaterialApp(
        initialRoute: LoadingScreen.route,
        onGenerateRoute: RouteGenerator.generateRoute,
        // routes: {
        //   HomeScreen.route: (context) =>
        //       HomeScreen(), // context: find a widget in the OVERALL widget tree
        // ReviewScreen.route: (context) => ReviewScreen(),
        // LoadingScreen.route: (context) => LoadingScreen(),
        // LoadingScreen2.route: (context) => LoadingScreen2(),
        // BrowseBooksScreen.route: (context) => BrowseBooksScreen(),
        // },
      ),
    ),
  );
}
