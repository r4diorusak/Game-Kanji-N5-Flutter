import 'package:google_generative_ai/google_generative_ai.dart';
import '../models/kanji_model.dart';

class GeminiService {
  static const String _apiKey = 'AIzaSyCiOipfz4qcehF8SyGRnpkwBj-AJ2bx7_Y';
  late final GenerativeModel _model;

  static const String _systemPrompt = 
      'Anda adalah AI assistant yang membantu pengguna belajar kanji Jepang level N5. '
      'Jawablah pertanyaan pengguna dengan ramah, jelas, dan dalam bahasa Indonesia.';

  GeminiService() {
    _model = GenerativeModel(
      model: 'gemini-3-pro-preview',
      apiKey: _apiKey,
      generationConfig: GenerationConfig(
        temperature: 0.7,
        topP: 0.95,
        topK: 40,
        maxOutputTokens: 8192,
        responseMimeType: 'text/plain',
      ),
      safetySettings: [
        SafetySetting(HarmCategory.harassment, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.none),
      ],
    );
  }

  /// Chat sederhana dengan AI
  Future<String> chat(String message, {KanjiModel? currentKanji}) async {
    String prompt = '$_systemPrompt\n\n';
    
    if (currentKanji != null) {
      prompt += 'Konteks: Saya sedang belajar kanji "${currentKanji.character}" (${currentKanji.meaning}).\n\n';
    }
    
    prompt += 'User: $message\nAI:';

    try {
      print('🤖 Chat: Mengirim request...');
      final response = await _model.generateContent([Content.text(prompt)]);
      print('✅ Chat: Response diterima');
      return response.text ?? 'Maaf, saya tidak mengerti.';
    } catch (e) {
      print('❌ Chat Error: $e');
      return 'Error: ${e.toString()}';
    }
  }

  /// Generate cerita pendek untuk latihan
  Future<String> generateShortStory(KanjiModel kanji) async {
    final prompt = '''
$_systemPrompt

Buatkan cerita pendek sederhana (5-8 kalimat) dalam bahasa Jepang yang menggunakan kanji "${kanji.character}" (arti: ${kanji.meaning}).
Gunakan kosakata level N5.

INSTRUKSI KHUSUS:
Saya ingin pembaca bisa mengetuk setiap kata untuk melihat artinya.
Tulis cerita dalam format: KataJepang{ArtiIndonesia}
Bungkus SETIAP kata/frasa dalam cerita dengan format tersebut.
Jangan sertakan terjemahan terpisah atau Romaji.
Jangan gunakan spasi antar format jika tidak perlu.

Contoh output:
私{Saya}は{partikel}学生{murid}です{sopan}。今日{Hari ini}は{partikel}いい{bagus}天気{cuaca}です{sopan}。

Format output:
[Cerita dalam format custom]
''';

    try {
      print('🤖 Story: Mengirim request...');
      final response = await _model.generateContent([Content.text(prompt)]);
      print('✅ Story: Response diterima');
      return response.text ?? 'Maaf, tidak bisa membuat cerita saat ini.';
    } catch (e) {
      print('❌ Story Error: $e');
      return 'Error: ${e.toString()}';
    }
  }
}
