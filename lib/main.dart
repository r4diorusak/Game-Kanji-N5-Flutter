import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'data/kanji_data.dart';
import 'models/kanji_model.dart';
import 'widgets/flip_card.dart';

import 'services/gemini_service.dart';

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

  Future<void> _generateAndShowStory(KanjiModel kanji) async {
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
    if (mounted) Navigator.pop(context);

    // Show result
    if (mounted) {
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
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
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
                              child: SizedBox(
                                width: double.infinity,
                                child: OutlinedButton.icon(
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
