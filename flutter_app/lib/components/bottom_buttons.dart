// This class is for the dialy_review_screen
import 'package:readview_app/components/quoteCardsStack.dart';

import '../services/tts.dart';
import 'package:flutter/material.dart';

class bottomButtonsRow extends StatelessWidget {
  final quoteCardsStackInstance;
  bottomButtonsRow(this.quoteCardsStackInstance);

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
            print(TTS.isSpeaking);
            if (TTS.isSpeaking == true) {
              TTS.stop();
            } else {
              TTS tts = TTS(quoteCardsStackInstance.getCurrentQuote());
              tts.speak();
            }
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
