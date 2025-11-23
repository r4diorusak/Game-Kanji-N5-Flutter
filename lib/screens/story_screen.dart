import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../models/kanji_model.dart';
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
              Text('Sedang membuat cerita pendek...'),
            ],
          ),
        ),
      ),
    );

    final service = GeminiService();
    final story = await service.generateShortStory(kanji);
    print('📝 Raw Story Output:\n$story'); // Debug log

    // Close loading
    if (context.mounted) Navigator.pop(context);

    // Show result
    if (context.mounted) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => Container(
          height: MediaQuery.of(context).size.height * 0.7,
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
              Expanded(
                child: SingleChildScrollView(
                  child: _buildInteractiveStory(story),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  '💡 Ketuk kata yang bergaris bawah untuk melihat artinya',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
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
