// This class is for the dialy_review_screen
import '../services/tts.dart';
import 'package:flutter/material.dart';


class bottomButtonsRow extends StatelessWidget {
  final quote;
  bottomButtonsRow(this.quote);
  static late TTS tts;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.favorite),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            tts = TTS(quote);
            tts.speak();
          },
          child: Icon(Icons.hearing),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.edit),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.delete),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
