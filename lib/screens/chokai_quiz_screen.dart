import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../models/kanji_model.dart';
import '../services/gemini_service.dart';

class ChokaiQuizScreen {
  final BuildContext context;
  final FlutterTts flutterTts;
  final bool Function() getIsSpeaking;
  final Function(String) speak;

  ChokaiQuizScreen({
    required this.context,
    required this.flutterTts,
    required this.getIsSpeaking,
    required this.speak,
  });

  Future<void> show(KanjiModel kanji) async {
    // Show loading
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(24),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Color(0xFF6366F1)),
              SizedBox(height: 16),
              Text('Sedang membuat soal Chokai...'),
            ],
          ),
        ),
      ),
    );

    final service = GeminiService();
    final quizData = await service.generateChokaiQuiz(kanji);
    
    // Close loading
    if (context.mounted) Navigator.pop(context);

    if (quizData.isEmpty || quizData.containsKey('error')) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal membuat soal: ${quizData['error'] ?? 'Unknown error'}')),
        );
      }
      return;
    }

    // Show result
    if (context.mounted) {
      _showQuizSheet(quizData);
    }
  }

  void _showQuizSheet(Map<String, dynamic> quizData) {
    final story = quizData['story'] as String;
    final question = quizData['question'] as String;
    final options = List<String>.from(quizData['options']);
    final correctAnswerIndex = quizData['correctAnswerIndex'] as int;

    // Auto play audio when opened
    speak(story);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Latihan Chokai (Listening)',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6366F1),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        flutterTts.stop();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                const Divider(),
                
                // Audio Controls
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.headphones, size: 48, color: Color(0xFF6366F1)),
                      const SizedBox(height: 8),
                      const Text(
                        'Dengarkan Cerita',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton.icon(
                        onPressed: () => speak(story),
                        icon: Icon(getIsSpeaking() ? Icons.stop : Icons.play_arrow),
                        label: Text(getIsSpeaking() ? 'Stop' : 'Putar Ulang'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6366F1),
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Question
                Text(
                  'Pertanyaan:',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  question,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Options
                Expanded(
                  child: ListView.separated(
                    itemCount: options.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return OutlinedButton(
                        onPressed: () {
                          // Check answer
                          final isCorrect = index == correctAnswerIndex;
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(isCorrect ? 'Benar! 🎉' : 'Salah 😅'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(isCorrect 
                                    ? 'Hebat! Jawabanmu tepat.' 
                                    : 'Jawaban yang benar adalah:\n${options[correctAnswerIndex]}'
                                  ),
                                  const SizedBox(height: 16),
                                  const Text('Transkrip Cerita:', style: TextStyle(fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 4),
                                  Text(story, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Close dialog
                                    if (isCorrect) {
                                      Navigator.pop(context); // Close quiz if correct
                                    }
                                  },
                                  child: Text(isCorrect ? 'Selesai' : 'Coba Lagi'),
                                ),
                              ],
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                          alignment: Alignment.centerLeft,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          '${String.fromCharCode(65 + index)}. ${options[index]}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF374151),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
