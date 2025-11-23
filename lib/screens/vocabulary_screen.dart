import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../data/vocabulary_data.dart';
import '../models/vocabulary_model.dart';
import '../widgets/flip_card.dart';
import '../screens/chokai_quiz_screen.dart';
import '../screens/story_screen.dart';
import '../screens/video_learning_screen.dart';

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({super.key});

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  int _currentIndex = 0;
  final Set<int> _learnedVocab = {};
  final FlutterTts flutterTts = FlutterTts();
  bool isSpeaking = false;

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  Future<void> _initTts() async {
    await flutterTts.setLanguage("ja-JP");
    await flutterTts.setSpeechRate(0.4);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
    await flutterTts.awaitSpeakCompletion(true);
    
    flutterTts.setStartHandler(() {
      setState(() {
        isSpeaking = true;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeaking = false;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        isSpeaking = false;
      });
    });
  }

  Future<void> _speak(String text) async {
    if (isSpeaking) {
      await flutterTts.stop();
      setState(() {
        isSpeaking = false;
      });
      return;
    }

    String cleanText = text;
    cleanText = cleanText.replaceAll('**', '');
    cleanText = cleanText.replaceAllMapped(
      RegExp(r'[\{｛]([^\{\}｛｝]+)[\}｝]'),
      (match) => ''
    );
    cleanText = cleanText.replaceAll('\n', ' ');

    await flutterTts.speak(cleanText);
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  void _nextCard() {
    if (_currentIndex < vocabularyData.length - 1) {
      setState(() {
        _currentIndex++;
      });
    }
  }

  void _previousCard() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  void _toggleLearned() {
    setState(() {
      if (_learnedVocab.contains(_currentIndex)) {
        _learnedVocab.remove(_currentIndex);
      } else {
        _learnedVocab.add(_currentIndex);
      }
    });
  }

  void _generateAndShowStory(VocabularyModel vocab) {
    // Convert VocabularyModel to a format compatible with StoryScreen
    final storyScreen = StoryScreen(
      context: context,
      flutterTts: flutterTts,
      getIsSpeaking: () => isSpeaking,
      speak: _speak,
    );
    // Note: We'll need to modify StoryScreen to accept vocabulary
    // For now, we'll show a placeholder
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Fitur cerita untuk kosa kata segera hadir!')),
    );
  }

  void _generateAndShowChokai(VocabularyModel vocab) {
    // Similar to story
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Fitur chokai untuk kosa kata segera hadir!')),
    );
  }

  void _generateAndShowVideo(VocabularyModel vocab) {
    VideoLearningScreen(context: context).show(vocab);
  }

  @override
  Widget build(BuildContext context) {
    final vocab = vocabularyData[_currentIndex];
    final isLearned = _learnedVocab.contains(_currentIndex);
    final progress = _learnedVocab.length / vocabularyData.length;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF10B981),
              Color(0xFF059669),
              Color(0xFF047857),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '語彙 N5',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '${_currentIndex + 1} / ${vocabularyData.length}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 8,
                        backgroundColor: Colors.white.withOpacity(0.3),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Dipelajari: ${_learnedVocab.length} / ${vocabularyData.length}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),

              // Flashcard
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: FlipCard(
                      front: _buildCardFace(
                        isLearned: isLearned,
                        onLearnedTap: _toggleLearned,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                            Text(
                              vocab.word,
                              style: const TextStyle(
                                fontSize: 100,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1F2937),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              vocab.reading,
                              style: const TextStyle(
                                fontSize: 24,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                            const SizedBox(height: 40),
                            const Text(
                              'Ketuk untuk melihat arti',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF9CA3AF),
                              ),
                            ),
                            ],
                          ),
                        ),
                      ),
                      back: _buildCardFace(
                        isLearned: isLearned,
                        onLearnedTap: _toggleLearned,
                        child: Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Column(
                                          children: [
                                            Text(
                                              vocab.word,
                                              style: const TextStyle(
                                                fontSize: 60,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF1F2937),
                                              ),
                                            ),
                                            Text(
                                              vocab.reading,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Color(0xFF6B7280),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                      _buildInfoRow('Arti', vocab.meaning),
                                      const SizedBox(height: 16),
                                      _buildInfoRow('Jenis', vocab.type),
                                      const SizedBox(height: 24),
                                      const Text(
                                        'Contoh:',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF10B981),
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      ...vocab.examples.map((example) => Padding(
                                            padding: const EdgeInsets.only(bottom: 8),
                                            child: Text(
                                              '• $example',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF4B5563),
                                                height: 1.5,
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  OutlinedButton.icon(
                                    onPressed: () => _generateAndShowChokai(vocab),
                                    icon: const Icon(Icons.headphones, size: 20),
                                    label: const Text('Latihan Chokai (AI)'),
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: const Color(0xFF10B981),
                                      side: const BorderSide(color: Color(0xFF10B981)),
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  OutlinedButton.icon(
                                    onPressed: () => _generateAndShowStory(vocab),
                                    icon: const Icon(Icons.book, size: 20),
                                    label: const Text('Latihan Cerita Pendek (AI)'),
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: const Color(0xFF10B981),
                                      side: const BorderSide(color: Color(0xFF10B981)),
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  OutlinedButton.icon(
                                    onPressed: () => _generateAndShowVideo(vocab),
                                    icon: const Icon(Icons.play_circle_outline, size: 20),
                                    label: const Text('Latihan Video (AI)'),
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: const Color(0xFF10B981),
                                      side: const BorderSide(color: Color(0xFF10B981)),
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Controls
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _currentIndex > 0 ? _previousCard : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF10B981),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 0,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_back),
                                SizedBox(width: 8),
                                Text(
                                  'Sebelumnya',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _currentIndex < vocabularyData.length - 1
                                ? _nextCard
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF10B981),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 0,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Selanjutnya',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardFace({
    required Widget child,
    required bool isLearned,
    required VoidCallback onLearnedTap,
  }) {
    return Container(
      width: double.infinity,
      height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          child,
          Positioned(
            top: 16,
            right: 16,
            child: GestureDetector(
              onTap: onLearnedTap,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isLearned ? const Color(0xFF10B981) : Colors.grey.shade200,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  isLearned ? Icons.check_circle : Icons.circle_outlined,
                  color: isLearned ? Colors.white : Colors.grey.shade400,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF10B981),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF1F2937),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
