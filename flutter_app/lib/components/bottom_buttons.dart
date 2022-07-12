// This class is for the dialy_review_screen
import '../services/tts.dart';
import 'package:flutter/material.dart';

class bottomButtonsRow extends StatefulWidget {
  final quoteCardsStackInstance;
  bottomButtonsRow(this.quoteCardsStackInstance);
  @override
  State<bottomButtonsRow> createState() => _bottomButtonsRowState();
}

class _bottomButtonsRowState extends State<bottomButtonsRow> {
  IconData ttsIcon = Icons.volume_up;
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
              if (TTS.isSpeaking) {
                TTS.stop();
                ttsIcon = Icons.volume_up;
              } else {
                TTS tts = TTS(widget.quoteCardsStackInstance.getCurrentQuote());
                tts.speak();
                ttsIcon = Icons.volume_off;
              }
            });
          },
          child: Icon(ttsIcon),
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
