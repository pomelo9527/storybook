import 'package:flutter_tts/flutter_tts.dart';

class TTSService {

  final FlutterTts tts =
      FlutterTts();

  Future init() async {

    await tts.setLanguage("zh-CN");

    await tts.setSpeechRate(0.4);
  }

  Future speak(String text) async {

    await tts.speak(text);
  }
}