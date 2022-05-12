import 'package:flutter/material.dart';
import '/classes/tts.dart';

class DailyReview extends StatefulWidget {
  // when you change a stateless widget to a stateful widget, you have to restart
  final List<String> stringList = [
    "I'm selfish, impatient and a little insecure. I make mistakes, I am out of control and at times hard to handle. But if you can't handle me at my worst, then you sure as hell don't deserve me at my best.",
    "Two things are infinite: the universe and human stupidity; and I'm not sure about the universe ",
    "You know you're in love when you can't fall asleep because reality is finally better than your dreams.",
    "I've learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel."
  ];
  @override
  State<DailyReview> createState() => _DailyReviewState();
}

class _DailyReviewState extends State<DailyReview> {
  int bookIndex = 0;
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
                  child: Text("${widget.stringList[bookIndex]}"),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      bookIndex -= 1;
                    });
                  },
                  child: Transform.scale(
                    scaleX: -1,
                    child: Icon(Icons.navigate_next),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    TTS tts = TTS(widget.stringList[bookIndex]);
                    tts.speak();
                  },
                  child: Icon(Icons.hearing),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.favorite),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.delete),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // trigers a rebuild: it'll look through the widget to see what's changed to modify it on the screen
                      bookIndex +=
                          1; // this marks everywhere bookIndex is used as "dirty" to redraw them on hot reload
                    });
                  },
                  child: Icon(Icons.navigate_next),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
