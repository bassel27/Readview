// TODO: pause and play tts on changing quote
// TODO: arabic quotes
import 'package:flutter/cupertino.dart';
import 'package:flutter_tts/flutter_tts.dart';

enum TtsState { playing, stopped, paused, continued }
FlutterTts flutterTts = FlutterTts();

class TTS extends ChangeNotifier {
  bool isSpeaking = false;

  Future<void> stop() async {
    try {
      await flutterTts.stop();
      this.isSpeaking = false;
      notifyListeners();
    } catch (e) {}
  }

  void speak(text) async {
    isSpeaking = true;
    notifyListeners();
    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.setPitch(1.0);
    await flutterTts.setLanguage("en-US");
    await flutterTts.speak(text);
    this.isSpeaking = false;
    notifyListeners();
  }
  
}
