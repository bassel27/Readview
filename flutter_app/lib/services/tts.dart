// TODO: pause and play tts on changing quote
// TODO: arabic quotes
import 'package:flutter_tts/flutter_tts.dart';

enum TtsState { playing, stopped, paused, continued }
FlutterTts flutterTts = FlutterTts();

class TTS {
  static bool isSpeaking = false;
  final text;
  TtsState ttsState = TtsState.stopped;

  TTS(this.text);

  static Future<void> stop() async {
    try {
      await flutterTts.stop();
      isSpeaking = false;
    } catch (e) {}
  }

  void speak() async {
    isSpeaking = true;
    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.setPitch(1.0);
    await flutterTts.setLanguage("en-US");
    await flutterTts.speak(this.text);
    isSpeaking = false;
  }
}
