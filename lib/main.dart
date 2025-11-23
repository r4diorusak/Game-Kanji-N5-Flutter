import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'data/kanji_data.dart';
import 'models/kanji_model.dart';
import 'widgets/flip_card.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'screens/chokai_quiz_screen.dart';
import 'screens/story_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const KanjiN5App());
}

class KanjiN5App extends StatelessWidget {
  const KanjiN5App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'N5 Go',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
      ),
      home: const KanjiGameScreen(),
    );
  }
}

class KanjiGameScreen extends StatefulWidget {
  const KanjiGameScreen({super.key});

  @override
  State<KanjiGameScreen> createState() => _KanjiGameScreenState();
}

class _KanjiGameScreenState extends State<KanjiGameScreen> {
  int _currentIndex = 0;
  final Set<int> _learnedKanji = {};
  final FlutterTts flutterTts = FlutterTts();
  bool isSpeaking = false;

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  Future<void> _initTts() async {
    await flutterTts.setLanguage("ja-JP");
    await flutterTts.setSpeechRate(0.4); // Slower for N5 learners
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
    await flutterTts.awaitSpeakCompletion(true); // Wait for completion
    
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

    // Clean text for reading
    String cleanText = text;
    
    // 1. Remove markdown bold
    cleanText = cleanText.replaceAll('**', '');
    
    // 2. Remove {meaning} blocks
    // We want to keep the word before the bracket, and remove the bracket and its content.
    // Example: 本{buku} -> 本
    cleanText = cleanText.replaceAllMapped(
      RegExp(r'[\{｛]([^\{\}｛｝]+)[\}｝]'),
      (match) => '' // Just remove the bracket part, keeping the preceding word
    );

    // 3. Replace newlines with spaces to prevent TTS from stopping unexpectedly
    cleanText = cleanText.replaceAll('\n', ' ');

    await flutterTts.speak(cleanText);
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  void _nextCard() {
    if (_currentIndex < kanjiData.length - 1) {
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
      if (_learnedKanji.contains(_currentIndex)) {
        _learnedKanji.remove(_currentIndex);
      } else {
        _learnedKanji.add(_currentIndex);
      }
    });
  }

  void _generateAndShowStory(KanjiModel kanji) {
    final storyScreen = StoryScreen(
      context: context,
      flutterTts: flutterTts,
      getIsSpeaking: () => isSpeaking,
      speak: _speak,
    );
    storyScreen.show(kanji);
  }

  void _generateAndShowChokai(KanjiModel kanji) {
    final chokaiScreen = ChokaiQuizScreen(
      context: context,
      flutterTts: flutterTts,
      getIsSpeaking: () => isSpeaking,
      speak: _speak,
    );
    chokaiScreen.show(kanji);
  }

  @override
  Widget build(BuildContext context) {
    final kanji = kanjiData[_currentIndex];
    final isLearned = _learnedKanji.contains(_currentIndex);
    final progress = _learnedKanji.length / kanjiData.length;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6366F1),
              Color(0xFF8B5CF6),
              Color(0xFFEC4899),
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
                          '漢字 N5',
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
                            '${_currentIndex + 1} / ${kanjiData.length}',
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
                    // Progress bar
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
                      'Dipelajari: ${_learnedKanji.length} / ${kanjiData.length}',
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              kanji.character,
                              style: const TextStyle(
                                fontSize: 120,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1F2937),
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
                      back: _buildCardFace(
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
                                        child: Text(
                                          kanji.character,
                                          style: const TextStyle(
                                            fontSize: 60,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF1F2937),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                      _buildInfoRow('Arti', kanji.meaning),
                                      const SizedBox(height: 16),
                                      _buildInfoRow('Kunyomi', kanji.kunyomi),
                                      if (kanji.onyomi != null &&
                                          kanji.onyomi!.isNotEmpty) ...[
                                        const SizedBox(height: 16),
                                        _buildInfoRow('Onyomi', kanji.onyomi!),
                                      ],
                                      const SizedBox(height: 24),
                                      const Text(
                                        'Contoh:',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF6366F1),
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      ...kanji.examples.map((example) => Padding(
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
                                    onPressed: () => _generateAndShowChokai(kanji),
                                    icon: const Icon(Icons.headphones, size: 20),
                                    label: const Text('Latihan Chokai (AI)'),
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: const Color(0xFF6366F1),
                                      side: const BorderSide(color: Color(0xFF6366F1)),
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  OutlinedButton.icon(
                                    onPressed: () => _generateAndShowStory(kanji),
                                    icon: const Icon(Icons.book, size: 20),
                                    label: const Text('Latihan Cerita Pendek (AI)'),
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: const Color(0xFF6366F1),
                                      side: const BorderSide(color: Color(0xFF6366F1)),
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
                child: Column(
                  children: [
                    // Mark as learned button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _toggleLearned,
                        icon: Icon(
                          isLearned ? Icons.check_circle : Icons.circle_outlined,
                          color: isLearned ? Colors.white : const Color(0xFF6366F1),
                        ),
                        label: Text(
                          isLearned ? 'Sudah Dipelajari' : 'Tandai Sudah Dipelajari',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isLearned ? Colors.white : const Color(0xFF6366F1),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isLearned
                              ? const Color(0xFF10B981)
                              : Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Navigation buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _currentIndex > 0 ? _previousCard : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF6366F1),
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
                            onPressed: _currentIndex < kanjiData.length - 1
                                ? _nextCard
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF6366F1),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  Widget _buildCardFace({required Widget child}) {
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
      child: child,
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
              color: Color(0xFF6366F1),
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
