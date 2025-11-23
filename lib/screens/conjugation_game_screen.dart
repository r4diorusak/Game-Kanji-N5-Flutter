import 'package:flutter/material.dart';
import '../data/verb_data.dart';
import '../utils/verb_conjugator.dart';
import 'dart:math';

class ConjugationGameScreen extends StatefulWidget {
  const ConjugationGameScreen({super.key});

  @override
  State<ConjugationGameScreen> createState() => _ConjugationGameScreenState();
}

class _ConjugationGameScreenState extends State<ConjugationGameScreen> {
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
    final List<VerbModel> shuffledVerbs = List.from(verbData)..shuffle(random);
    final selectedVerbs = shuffledVerbs.take(50).toList();

    _questions = selectedVerbs.map((verb) {
      final type = random.nextInt(4); // 0: Masu, 1: Te, 2: Ta, 3: Nai
      
      String fromForm = 'Bentuk Kamus';
      String toForm = '';
      String questionWord = verb.dictionary;
      String correctAnswer = '';
      List<String> options = [];

      switch (type) {
        case 0: // Masu
          toForm = 'Bentuk Masu';
          correctAnswer = VerbConjugator.toMasu(verb);
          options = [
            correctAnswer,
            VerbConjugator.toTe(verb),
            VerbConjugator.toNai(verb),
            '${verb.dictionary}ます' // Fake
          ];
          break;
        case 1: // Te
          toForm = 'Bentuk Te';
          correctAnswer = VerbConjugator.toTe(verb);
          options = [
            correctAnswer,
            VerbConjugator.toTa(verb),
            VerbConjugator.toMasu(verb),
            '${verb.dictionary}て' // Fake
          ];
          break;
        case 2: // Ta
          toForm = 'Bentuk Ta (Lampau)';
          correctAnswer = VerbConjugator.toTa(verb);
          options = [
            correctAnswer,
            VerbConjugator.toTe(verb),
            VerbConjugator.toNai(verb),
            '${verb.dictionary}た' // Fake
          ];
          break;
        case 3: // Nai
          toForm = 'Bentuk Nai (Negatif)';
          correctAnswer = VerbConjugator.toNai(verb);
          options = [
            correctAnswer,
            VerbConjugator.toMasu(verb),
            VerbConjugator.toTe(verb),
            '${verb.dictionary}ない' // Fake
          ];
          break;
      }

      // Ensure unique options and shuffle
      options = options.toSet().toList();
      while (options.length < 4) {
        options.add('Option ${options.length}'); // Fallback
      }
      options.shuffle(random);

      return {
        'word': questionWord,
        'from': fromForm,
        'to': toForm,
        'options': options,
        'correct': correctAnswer,
        'meaning': verb.meaning,
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
        title: const Text('Latihan Konjugasi'),
        backgroundColor: const Color(0xFF06B6D4),
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF06B6D4).withOpacity(0.1),
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
                        color: const Color(0xFF06B6D4),
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

                // Question Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
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
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE0F2FE),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${question['from']} → ${question['to']}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0369A1),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        question['word'],
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '(${question['meaning']})',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Icon(
                        Icons.arrow_downward,
                        size: 32,
                        color: Color(0xFF06B6D4),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        question['to'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF06B6D4),
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
                      Color borderColor = const Color(0xFF06B6D4);
                      
                      if (_showResult && isSelected) {
                        bgColor = _isCorrect ? const Color(0xFF10B981) : const Color(0xFFEF4444);
                        borderColor = _isCorrect ? const Color(0xFF10B981) : const Color(0xFFEF4444);
                      } else if (_showResult && isCorrectAnswer) {
                        bgColor = const Color(0xFF10B981);
                        borderColor = const Color(0xFF10B981);
                      } else if (isSelected) {
                        bgColor = const Color(0xFF06B6D4).withOpacity(0.1);
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
                              const SizedBox(width: 16),
                              Text(
                                option,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: (_showResult && (isSelected || isCorrectAnswer))
                                      ? Colors.white
                                      : const Color(0xFF1F2937),
                                ),
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
                      backgroundColor: const Color(0xFF06B6D4),
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
