// This class is for the dialy_review_screen
import '../services/tts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class bottomButtonsRow extends StatelessWidget {
  final quoteCardsStackInstance;
  bottomButtonsRow(this.quoteCardsStackInstance);

  @override
  Widget build(BuildContext context) {
    final IconData ttsIcon = !Provider.of<TTS>(context).isSpeaking
        ? Icons.volume_up
        : Icons.volume_off;
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
            // setState(() {
            if (Provider.of<TTS>(context, listen: false).isSpeaking) {
              Provider.of<TTS>(context, listen: false).stop();
            } else {
              Provider.of<TTS>(context, listen: false).speak(
                quoteCardsStackInstance.getCurrentQuote(),
              );
            }
            // });
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
