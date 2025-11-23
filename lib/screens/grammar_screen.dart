import 'package:flutter/material.dart';

class GrammarScreen extends StatelessWidget {
  const GrammarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF59E0B),
              Color(0xFFD97706),
              Color(0xFFB45309),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '文法 (Tata Bahasa)',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Level N5',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: ListView(
                    children: [
                      _buildExampleCard(
                        title: 'Contoh 1: Partikel は (wa)',
                        pattern: '[Subjek] は [Predikat]',
                        explanation: 'Menunjukkan topik kalimat',
                        example: '私は学生です。',
                        exampleMeaning: 'Saya adalah pelajar.',
                      ),
                      const SizedBox(height: 16),
                      _buildExampleCard(
                        title: 'Contoh 2: Partikel を (wo)',
                        pattern: '[Objek] を [Kata Kerja]',
                        explanation: 'Menunjukkan objek langsung',
                        example: '本を読みます。',
                        exampleMeaning: 'Membaca buku.',
                      ),
                      const SizedBox(height: 16),
                      _buildExampleCard(
                        title: 'Contoh 3: Bentuk ～ます (masu)',
                        pattern: '[Kata Kerja] ます',
                        explanation: 'Bentuk sopan kata kerja',
                        example: '毎日勉強します。',
                        exampleMeaning: 'Saya belajar setiap hari.',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExampleCard({
    required String title,
    required String pattern,
    required String explanation,
    required String example,
    required String exampleMeaning,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF59E0B),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFEF3C7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              pattern,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF92400E),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            explanation,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF6B7280),
            ),
          ),
          const Divider(height: 24),
          Text(
            example,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF1F2937),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            exampleMeaning,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF9CA3AF),
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
