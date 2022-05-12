import 'package:flutter_tts/flutter_tts.dart';

class TTS {
  final text;
  TTS(this.text);
  void speak() async {
    FlutterTts flutterTts = FlutterTts();
    // await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(this.text);
  }
}
