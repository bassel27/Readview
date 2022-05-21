import 'package:flutter_tts/flutter_tts.dart';
FlutterTts flutterTts = FlutterTts();

class TTS {
  static bool isStopped = false;
  final text;
  TTS(this.text);
  void speak() async {
    await flutterTts.setPitch(1.0);
    await flutterTts.setLanguage("en-US");
    flutterTts.speak(this.text);
  }

  static stop() async {
    try{
      await flutterTts.stop();
    }catch(e){}
  }
}
