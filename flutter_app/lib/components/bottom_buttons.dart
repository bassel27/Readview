// This class is for the dialy_review_screen
import '../services/tts.dart';
import 'package:flutter/material.dart';

class bottomButtonsRow extends StatefulWidget {
  final quoteCardsStackInstance;
  bottomButtonsRow(this.quoteCardsStackInstance);
  IconData ttsIcon = Icons.hearing;
  @override
  State<bottomButtonsRow> createState() => _bottomButtonsRowState();
}

class _bottomButtonsRowState extends State<bottomButtonsRow> {
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
            setState(() {
              if (TTS.isSpeaking == true) {
                TTS.stop();
                widget.ttsIcon = Icons.hearing;
              } else {
                TTS tts = TTS(widget.quoteCardsStackInstance.getCurrentQuote());
                tts.speak();
                widget.ttsIcon = Icons.stop;
              }
            });
          },
          child: Icon(widget.ttsIcon),
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
