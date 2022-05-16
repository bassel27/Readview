import 'package:flutter/material.dart';
import '../others/constants.dart';
import '../components/home_body.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: Container(
          color: kDrawerColor,
        )),
        appBar: AppBar(
          toolbarHeight: 100,
          title: Image.asset('assets/Readview-logos_white.png'),
          centerTitle: true,
          backgroundColor: kAppbarColor,
          elevation: 0.0, // to prevent the dropshadow effect
        ),
        body: HomeBody());
  }
}
