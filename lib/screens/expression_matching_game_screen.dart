import 'package:flutter/material.dart';
import '../data/vocabulary_data.dart';
import '../models/vocabulary_model.dart';
import 'dart:math';

class ExpressionMatchingGameScreen extends StatefulWidget {
  const ExpressionMatchingGameScreen({super.key});

  @override
  State<ExpressionMatchingGameScreen> createState() => _ExpressionMatchingGameScreenState();
}

class _ExpressionMatchingGameScreenState extends State<ExpressionMatchingGameScreen> {
  int _currentQuestion = 0;
  int _score = 0;
  String? _selectedAnswer;
  bool _showResult = false;
  bool _isCorrect = false;

  List<Map<String, dynamic>> _questions = [];

  @override
  void initState() {
    super.initState();
    _generateQuestions();
  }

  void _generateQuestions() {
    final random = Random();
    // Ambil 10 kosa kata acak
    final List<VocabularyModel> shuffledVocab = List.from(vocabularyData)..shuffle(random);
    final selectedVocab = shuffledVocab.take(10).toList();

    _questions = selectedVocab.map((vocab) {
      // Ambil 3 pilihan salah acak
      final wrongOptions = vocabularyData
          .where((v) => v.id != vocab.id)
          .toList()
          ..shuffle(random);
      
      final options = [
        vocab.word, 
        wrongOptions[0].word, 
        wrongOptions[1].word, 
        wrongOptions[2].word
      ]..shuffle(random);

      return {
        'situation': vocab.meaning,
        'options': options,
        'correct': vocab.word,
        'meaning': vocab.meaning,
      };
    }).toList();
  }

  void _checkAnswer() {
    if (_selectedAnswer == null) return;

    setState(() {
      _isCorrect = _selectedAnswer == _questions[_currentQuestion]['correct'];
      if (_isCorrect) _score++;
      _showResult = true;
    });
  }

  void _nextQuestion() {
    if (_currentQuestion < _questions.length - 1) {
      setState(() {
        _currentQuestion++;
        _selectedAnswer = null;
        _showResult = false;
      });
    } else {
      _showFinalScore();
    }
  }

  void _showFinalScore() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Selesai! 🎉'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Skor Anda: $_score / ${_questions.length}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              _score >= 4 ? 'Hebat! 素晴らしい!' : 'Terus berlatih! 頑張って!',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _generateQuestions();
                _currentQuestion = 0;
                _score = 0;
                _selectedAnswer = null;
                _showResult = false;
              });
            },
            child: const Text('Main Lagi'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Kembali'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mencocokkan Ungkapan'),
        backgroundColor: const Color(0xFFF59E0B),
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFF59E0B).withOpacity(0.1),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Progress
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Soal ${_currentQuestion + 1}/${_questions.length}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF59E0B),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Skor: $_score',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Situation Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.chat_bubble_outline,
                        size: 48,
                        color: Color(0xFFF59E0B),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Situasi:',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        question['situation'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Ungkapan apa yang tepat?',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Answer Options
                Expanded(
                  child: ListView.separated(
                    itemCount: (question['options'] as List).length,
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final option = question['options'][index];
                      final isSelected = _selectedAnswer == option;
                      final isCorrectAnswer = option == question['correct'];
                      
                      Color bgColor = Colors.white;
                      Color borderColor = const Color(0xFFF59E0B);
                      IconData? icon;
                      
                      if (_showResult && isSelected) {
                        bgColor = _isCorrect ? const Color(0xFF10B981) : const Color(0xFFEF4444);
                        borderColor = _isCorrect ? const Color(0xFF10B981) : const Color(0xFFEF4444);
                        icon = _isCorrect ? Icons.check_circle : Icons.cancel;
                      } else if (_showResult && isCorrectAnswer) {
                        bgColor = const Color(0xFF10B981);
                        borderColor = const Color(0xFF10B981);
                        icon = Icons.check_circle;
                      } else if (isSelected) {
                        bgColor = const Color(0xFFF59E0B).withOpacity(0.1);
                      }

                      return GestureDetector(
                        onTap: _showResult ? null : () {
                          setState(() {
                            _selectedAnswer = option;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: bgColor,
                            border: Border.all(color: borderColor, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  option,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: (_showResult && (isSelected || isCorrectAnswer))
                                        ? Colors.white
                                        : const Color(0xFF1F2937),
                                  ),
                                ),
                              ),
                              if (icon != null)
                                Icon(
                                  icon,
                                  color: Colors.white,
                                  size: 28,
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 16),

                // Action Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _showResult ? _nextQuestion : _checkAnswer,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF59E0B),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      _showResult
                          ? (_currentQuestion < _questions.length - 1
                              ? 'Soal Berikutnya'
                              : 'Lihat Hasil')
                          : 'Cek Jawaban',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
