import 'package:flutter/material.dart';

class DailyReview extends StatefulWidget {
  @override
  State<DailyReview> createState() => _DailyReviewState();
}

class _DailyReviewState extends State<DailyReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 68, 75, 105),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Card(
                //  shadowed rectangle and curved edges
                color: Color.fromARGB(255, 255, 255, 255),
                child: Padding(
                  // the child of the padding widget is gonnna get a blanket around it
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Quote goes here",
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Row(children: [
                Icon(
                  Icons.favorite,
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
