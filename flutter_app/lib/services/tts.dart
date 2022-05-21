import 'package:flutter_tts/flutter_tts.dart';
FlutterTts flutterTts = FlutterTts();

class TTS {
  static bool isStopped = false;
  final text;
  TTS(this.text);
  void speak() async {
    await flutterTts.setPitch(1.0);
    await flutterTts.setLanguage("en-US");
    var result = flutterTts.speak(this.text);
  }

  static stop() async {
    await flutterTts.stop();
  }
}
