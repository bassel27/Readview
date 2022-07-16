import 'package:flutter/cupertino.dart';
import 'package:flutter_tts/flutter_tts.dart';

// TODO: arabic tts not working on phone but working on emulator
enum TtsState { playing, stopped, paused, continued }
FlutterTts flutterTts = FlutterTts();

class TTS extends ChangeNotifier {
  bool _isSpeaking =
      false; // change this attribute from a function to executre notifyListeners()   // this is why I made it a private property so as not to modify it directly, but reather through a function

  bool get isSpeaking {
    //getter because _isSpeaking value can't be accessed directly (private property can't be modified or accessed)
    return _isSpeaking;
  }

  Future<void> stop() async {
    try {
      await flutterTts.stop();
      this._isSpeaking = false;
      notifyListeners();
    } catch (e) {}
  }

  void speak(text) async {
    _isSpeaking = true;
    notifyListeners();
    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
    this._isSpeaking = false;
    notifyListeners();
  }
}
