import 'package:google_generative_ai/google_generative_ai.dart';
import 'dart:convert';
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

Buatkan cerita pendek sederhana (8-16 kalimat) dalam bahasa Jepang yang menggunakan kanji "${kanji.character}" (arti: ${kanji.meaning}).
Gunakan kosakata level N5.

INSTRUKSI KHUSUS:
Saya ingin pembaca bisa mengetuk setiap kata untuk melihat cara baca dan artinya.
Tulis cerita dalam format: KataJepang{CaraBaca(Hiragana) - ArtiIndonesia}
Bungkus SETIAP kata/frasa dalam cerita dengan format tersebut.
Jangan sertakan terjemahan terpisah atau Romaji.
Jangan gunakan spasi antar format jika tidak perlu.
JANGAN ada kalimat pembuka seperti "Tentu", "Berikut cerita", "Halo", dll.
LANGSUNG mulai dengan teks cerita Jepang.

Contoh output:
私{わたし - Saya}は{は - partikel}学生{がくせい - murid}です{です - sopan}。今日{きょう - Hari ini}は{は - partikel}いい{いい - bagus}天気{てんき - cuaca}です{です - sopan}。

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

  /// Generate Chokai Quiz (Listening Comprehension)
  Future<Map<String, dynamic>> generateChokaiQuiz(KanjiModel kanji) async {
    final prompt = '''
$_systemPrompt

Buatkan soal latihan CHOKAI (Listening Comprehension) level N5 yang berkaitan dengan kanji "${kanji.character}" (arti: ${kanji.meaning}).

Format Output HARUS JSON valid seperti ini:
{
  "story": "Teks cerita pendek bahasa Jepang (sekitar 4-6 kalimat) yang mengandung kanji target. JANGAN gunakan format {baca-arti}, tulis teks Jepang biasa saja.",
  "question": "Pertanyaan dalam bahasa Jepang tentang cerita di atas.",
  "options": ["Pilihan A (Jepang)", "Pilihan B (Jepang)", "Pilihan C (Jepang)", "Pilihan D (Jepang)"],
  "correctAnswerIndex": 0
}

Catatan:
- correctAnswerIndex adalah 0 untuk A, 1 untuk B, dst.
- Pastikan cerita dan pertanyaan menggunakan kosakata N5.
- Output HANYA JSON, tanpa teks lain.
''';

    try {
      print('🤖 Chokai: Mengirim request...');
      final response = await _model.generateContent([Content.text(prompt)]);
      print('✅ Chokai: Response diterima');
      
      final text = response.text ?? '{}';
      // Clean markdown code blocks if present
      final cleanText = text.replaceAll('```json', '').replaceAll('```', '').trim();
      
      // Simple JSON parsing (in a real app, use dart:convert)
      // For now, we'll rely on the AI following instructions, but we need to import dart:convert
      // Since we can't easily add imports to the top of the file with this tool without reading it all again,
      // we will assume the user has dart:convert or we will add it.
      // Wait, I can't add imports easily here. I'll use a regex parser or just add the import in a separate step.
      // Actually, I should add the import first.
      
      return _parseJson(cleanText);
    } catch (e) {
      print('❌ Chokai Error: $e');
      return {
        "error": e.toString()
      };
    }
  }

  Map<String, dynamic> _parseJson(String jsonString) {
    try {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      print('❌ JSON Parse Error: $e');
      return {};
    }
  }
}
