import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/vocabulary_model.dart';
import '../services/gemini_service.dart';

class VideoLearningScreen {
  final BuildContext context;

  VideoLearningScreen({required this.context});

  Future<void> show(VocabularyModel vocab) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (context) => _VideoLearningContent(vocab: vocab),
    );
  }
}

class _VideoLearningContent extends StatefulWidget {
  final VocabularyModel vocab;

  const _VideoLearningContent({required this.vocab});

  @override
  State<_VideoLearningContent> createState() => _VideoLearningContentState();
}

class _VideoLearningContentState extends State<_VideoLearningContent> {
  late YoutubePlayerController _controller;
  final GeminiService _geminiService = GeminiService();
  
  bool _isLoading = true;
  Map<String, dynamic>? _quizData;
  String? _selectedAnswer;
  bool _showResult = false;

  // Video ID for N5 Listening Practice
  // Note: Some videos disable embedding. If this happens, try another video ID.
  // Current: Japanese Listening Comprehension - Absolute Beginner (JapanesePod101)
  final String _videoId = 'hY7m5jjJ9mM';

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    _generateQuiz();
  }

  Future<void> _generateQuiz() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final data = await _geminiService.generateVideoQuiz(
        widget.vocab.word,
        widget.vocab.meaning,
      );

      if (mounted) {
        if (data.containsKey('error')) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${data['error']}')),
          );
        } else {
          setState(() {
            _quizData = data;
          });
        }
      }
    } catch (e) {
      print('Error generating quiz: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // Handle bar
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          
          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Video Learning',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6366F1),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),

          // Video Player
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: const Color(0xFF6366F1),
          ),

          // Content
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pelajari penggunaan kata "${widget.vocab.word}"',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Tonton video di atas dan jawab pertanyaan berikut ini.',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 24),
                        
                        // Quiz Section (Placeholder for now)
                        if (_quizData != null) ...[
                          Text(
                            _quizData!['question'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ...List.generate(
                            (_quizData!['options'] as List).length,
                            (index) {
                              final option = _quizData!['options'][index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectedAnswer = option;
                                    });
                                  },
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.all(16),
                                    backgroundColor: _selectedAnswer == option
                                        ? const Color(0xFF6366F1).withOpacity(0.1)
                                        : null,
                                    side: BorderSide(
                                      color: _selectedAnswer == option
                                          ? const Color(0xFF6366F1)
                                          : Colors.grey[300]!,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        String.fromCharCode(65 + index),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(child: Text(option)),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _selectedAnswer == null
                                  ? null
                                  : () {
                                      // Check answer logic
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF6366F1),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                              child: const Text('Cek Jawaban'),
                            ),
                          ),
                        ] else ...[
                          const Center(
                            child: Text('Gagal memuat kuis. Silakan coba lagi.'),
                          ),
                        ],
                        
                        SizedBox(height: MediaQuery.of(context).padding.bottom + 20),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
