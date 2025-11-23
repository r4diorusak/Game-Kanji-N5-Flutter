import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../models/kanji_model.dart';
import '../models/vocabulary_model.dart';
import '../services/gemini_service.dart';

class StoryScreen {
  final BuildContext context;
  final FlutterTts flutterTts;
  final bool Function() getIsSpeaking;
  final Function(String) speak;

  StoryScreen({
    required this.context,
    required this.flutterTts,
    required this.getIsSpeaking,
    required this.speak,
  });

  Future<void> show(dynamic model) async {
    // Show loading
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
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
              Text('Sedang membuat cerita pendek...'),
            ],
          ),
        ),
      ),
    );

    final service = GeminiService();
    Map<String, dynamic> storyData;

    try {
      if (model is KanjiModel) {
        storyData = await service.generateShortStory(model);
      } else if (model is VocabularyModel) {
        storyData = await service.generateShortStoryForVocab(model);
      } else {
        storyData = {'error': 'Tipe data tidak didukung'};
      }
    } catch (e) {
      storyData = {'error': e.toString()};
    }
    print('📝 Raw Story Output:\n$storyData'); // Debug log

    // Close loading
    if (context.mounted) Navigator.pop(context);

    // Check for error
    if (storyData.containsKey('error')) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${storyData['error']}')),
        );
      }
      return;
    }

    // Show story with question
    if (context.mounted) {
      _showStoryWithQuestion(storyData);
    }
  }

  void _showStoryWithQuestion(Map<String, dynamic> storyData) {
    final story = storyData['story'] ?? '';
    final question = storyData['question'] ?? '';
    final options = List<String>.from(storyData['options'] ?? []);
    final correctIndex = (storyData['correctAnswerIndex'] is int) 
        ? storyData['correctAnswerIndex'] as int
        : int.tryParse(storyData['correctAnswerIndex'].toString()) ?? 0;

    String? selectedAnswer;
    bool showResult = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext modalContext) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.85,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Cerita Pendek (Latihan)',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6366F1),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            getIsSpeaking() ? Icons.stop_circle_outlined : Icons.volume_up_outlined,
                            color: const Color(0xFF6366F1),
                          ),
                          onPressed: () => speak(story),
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
                  ],
                ),
                const Divider(),

                // Story Content
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInteractiveStory(story),
                        const SizedBox(height: 16),
                        const Divider(thickness: 2),
                        const SizedBox(height: 16),

                        // Question Section
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F4F6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Pertanyaan Pemahaman:',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF6366F1),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                question,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF1F2937),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Options
                        ...List.generate(options.length, (index) {
                          final option = options[index];
                          final isSelected = selectedAnswer == option;
                          final isCorrect = index == correctIndex;
                          
                          Color bgColor = Colors.white;
                          Color borderColor = const Color(0xFF6366F1);
                          
                          if (showResult && isSelected) {
                            bgColor = isSelected && isCorrect 
                                ? const Color(0xFF10B981) 
                                : const Color(0xFFEF4444);
                            borderColor = bgColor;
                          } else if (showResult && isCorrect) {
                            bgColor = const Color(0xFF10B981);
                            borderColor = bgColor;
                          } else if (isSelected) {
                            bgColor = const Color(0xFF6366F1).withOpacity(0.1);
                          }

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: GestureDetector(
                              onTap: showResult ? null : () {
                                setState(() {
                                  selectedAnswer = option;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: bgColor,
                                  border: Border.all(color: borderColor, width: 2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: borderColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(
                                          String.fromCharCode(65 + index),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        option,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: (showResult && (isSelected || isCorrect))
                                              ? Colors.white
                                              : const Color(0xFF1F2937),
                                        ),
                                      ),
                                    ),
                                    if (showResult && (isSelected || isCorrect))
                                      Icon(
                                        isCorrect ? Icons.check_circle : Icons.cancel,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),

                        const SizedBox(height: 16),

                        // Check Answer Button
                        if (!showResult)
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: selectedAnswer == null ? null : () {
                                setState(() {
                                  showResult = true;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF6366F1),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'Cek Jawaban',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                        // Result Message
                        if (showResult)
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: selectedAnswer == options[correctIndex]
                                  ? const Color(0xFF10B981).withOpacity(0.1)
                                  : const Color(0xFFEF4444).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: selectedAnswer == options[correctIndex]
                                    ? const Color(0xFF10B981)
                                    : const Color(0xFFEF4444),
                                width: 2,
                              ),
                            ),
                            child: Text(
                              selectedAnswer == options[correctIndex]
                                  ? '✅ Benar! Jawaban Anda tepat!'
                                  : '❌ Kurang tepat. Jawaban yang benar adalah: ${String.fromCharCode(65 + correctIndex)}',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: selectedAnswer == options[correctIndex]
                                    ? const Color(0xFF10B981)
                                    : const Color(0xFFEF4444),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        
                        // Add padding for Android navigation bar
                        SizedBox(height: MediaQuery.of(context).padding.bottom + 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInteractiveStory(String story) {
    // Remove markdown bold syntax if present
    story = story.replaceAll('**', '');
    
    final List<TextSpan> spans = [];
    // Support both standard {} and Japanese fullwidth ｛｝ brackets
    final RegExp exp = RegExp(r'([^\{\}｛｝]+)[\{｛]([^\{\}｛｝]+)[\}｝]');
    int lastIndex = 0;

    for (final Match match in exp.allMatches(story)) {
      // Add text before match
      if (match.start > lastIndex) {
        spans.add(TextSpan(
          text: story.substring(lastIndex, match.start),
          style: const TextStyle(
            color: Color(0xFF1F2937),
            fontSize: 18,
            height: 1.8,
          ),
        ));
      }

      final String word = match.group(1) ?? '';
      final String meaning = match.group(2) ?? '';

      // Add interactive word
      spans.add(TextSpan(
        text: word,
        style: const TextStyle(
          color: Color(0xFF1F2937),
          fontSize: 18,
          height: 1.8,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.dotted,
          decorationColor: Color(0xFF6366F1),
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(word),
                content: Text(
                  meaning,
                  style: const TextStyle(fontSize: 18),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Tutup'),
                  ),
                ],
              ),
            );
          },
      ));

      lastIndex = match.end;
    }

    // Add remaining text
    if (lastIndex < story.length) {
      spans.add(TextSpan(
        text: story.substring(lastIndex),
        style: const TextStyle(
          color: Color(0xFF1F2937),
          fontSize: 18,
          height: 1.8,
        ),
      ));
    }

    // If no matches found (fallback)
    if (spans.isEmpty) {
      return Text(
        story,
        style: const TextStyle(
          fontSize: 18,
          height: 1.8,
          color: Color(0xFF1F2937),
        ),
      );
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }
}
