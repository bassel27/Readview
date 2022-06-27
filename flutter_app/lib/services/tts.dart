// TODO: pause and play tts
// TODO: stop tts on second tap
import 'package:flutter_tts/flutter_tts.dart';

FlutterTts flutterTts = FlutterTts();

class TTS {
  static Future<void> stop() async {
    try {
      await flutterTts.stop();
    } catch (e) {}
  }

  static bool isSpeaking = false;
  final text;
  TTS(this.text);
  void speak() async {
    isSpeaking = true;
    await flutterTts.setPitch(1.0);
    await flutterTts.setLanguage("en-US");
    flutterTts.speak(this.text);
    isSpeaking = false;
  }
}
