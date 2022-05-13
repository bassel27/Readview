import 'package:flutter/material.dart';

int bookIndex = 0;

class quoteCard extends StatefulWidget {
  final List<String> stringList = [
    "1. I'm selfish, impatient and a little insecure. I make mistakes, I am out of control and at times hard to handle. But if you can't handle me at my worst, then you sure as hell don't deserve me at my best.",
    "2. Two things are infinite: the universe and human stupidity; and I'm not sure about the universe ",
    "3. You know you're in love when you can't fall asleep because reality is finally better than your dreams.",
    "4. I've learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel."
  ];
  @override
  State<quoteCard> createState() => _quoteCardState();

  String getCurrentQuote() {
    return stringList[bookIndex];
  }
}

class _quoteCardState extends State<quoteCard> {
  @override
  Widget build(BuildContext context) {
    print(bookIndex);
    return Expanded(
      child: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.velocity.pixelsPerSecond.dx < 1) {
            setState(() {
              bookIndex += 1;
            });
          } else {
            setState(() {
              bookIndex -= 1;
            });
          }
        },
        child: Card(
          shape: RoundedRectangleBorder(
            side:
                BorderSide(color: Color.fromARGB(179, 135, 111, 111), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          //  shadowed rectangle and curved edges
          color: Color.fromARGB(255, 255, 255, 255),
          child: Padding(
            // the child of the padding widget is gonnna get a blanket around it
            padding: EdgeInsets.all(10),
            child: Text("${widget.stringList[bookIndex]}"),
          ),
        ),
      ),
    );
  }
}
