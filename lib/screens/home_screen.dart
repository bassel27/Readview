import 'package:flutter/material.dart';
import '../others/constants.dart';
import '../components/home_body.dart';

class HomeScreen extends StatelessWidget {
  static const String route = "/home_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 100,
          title: Image.asset('assets/images/Readview-logos_white.png'),
          centerTitle: true,
          backgroundColor: kAppbarColor,
          elevation: 0.0, // to prevent the dropshadow effect
        ),
        body: HomeBody());
  }
}
