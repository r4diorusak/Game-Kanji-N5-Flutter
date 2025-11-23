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
      model: 'gemini-2.5-flash',
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

  /// Generate cerita pendek dengan pertanyaan untuk latihan Dokkai
  Future<Map<String, dynamic>> generateShortStory(KanjiModel kanji) async {
    final prompt = '''
$_systemPrompt

Buatkan cerita pendek sederhana (8-16 kalimat) dalam bahasa Jepang yang menggunakan kanji "${kanji.character}" (arti: ${kanji.meaning}).
Gunakan kosakata level N5.

INSTRUKSI KHUSUS:
1. Tulis cerita dalam format: KataJepang{CaraBaca(Hiragana) - ArtiIndonesia}
2. Bungkus SETIAP kata/frasa dalam cerita dengan format tersebut.
3. Setelah cerita, buat 1 pertanyaan pemahaman dalam bahasa Indonesia
4. Berikan 4 pilihan jawaban (A, B, C, D) dalam bahasa Indonesia
5. Tentukan jawaban yang benar (index 0-3)

JANGAN ada kalimat pembuka seperti "Tentu", "Berikut cerita", dll.
LANGSUNG berikan output dalam format JSON berikut:

{
  "story": "[Cerita dalam format custom dengan {baca-arti}]",
  "question": "[Pertanyaan pemahaman dalam bahasa Indonesia]",
  "options": ["Pilihan A", "Pilihan B", "Pilihan C", "Pilihan D"],
  "correctAnswerIndex": 0
}

Contoh story:
私{わたし - Saya}は{は - partikel}学生{がくせい - murid}です{です - sopan}。今日{きょう - Hari ini}は{は - partikel}いい{いい - bagus}天気{てんき - cuaca}です{です - sopan}。

Pastikan output adalah JSON yang valid!
''';

    try {
      print('🤖 Story: Mengirim request...');
      final response = await _model.generateContent([Content.text(prompt)]);
      print('✅ Story: Response diterima');
      
      final text = response.text ?? '';
      return _parseJson(text);
    } catch (e) {
      print('❌ Story Error: $e');
      return {'error': e.toString()};
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

  /// Generate Video Comprehension Quiz
  Future<Map<String, dynamic>> generateVideoQuiz(String word, String meaning) async {
    final prompt = '''
$_systemPrompt

Buatkan soal latihan pemahaman video (Video Comprehension) level N5 yang berkaitan dengan kata "$word" (arti: $meaning).
Bayangkan ada sebuah video pendek di mana dua orang sedang bercakap-cakap menggunakan kata tersebut.

Format Output HARUS JSON valid seperti ini:
{
  "question": "Pertanyaan pemahaman tentang situasi dalam percakapan imajiner tersebut (Bahasa Indonesia).",
  "options": ["Pilihan A (Indonesia)", "Pilihan B (Indonesia)", "Pilihan C (Indonesia)", "Pilihan D (Indonesia)"],
  "correctAnswerIndex": 0
}

Catatan:
- Buat pertanyaan yang menguji pemahaman konteks penggunaan kata tersebut.
- Output HANYA JSON.
''';

    try {
      print('🤖 Video Quiz: Mengirim request...');
      final response = await _model.generateContent([Content.text(prompt)]);
      print('✅ Video Quiz: Response diterima');
      
      final text = response.text ?? '{}';
      final cleanText = text.replaceAll('```json', '').replaceAll('```', '').trim();
      
      return _parseJson(cleanText);
    } catch (e) {
      print('❌ Video Quiz Error: $e');
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
