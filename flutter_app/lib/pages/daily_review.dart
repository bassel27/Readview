import 'package:flutter/material.dart';

class DailyReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Card(
              color: Colors.cyanAccent,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text("Quote goes here"),
              ),
            ),
          )
        ],
      )),
    );
  }
}
