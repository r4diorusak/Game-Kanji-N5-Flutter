import 'package:flutter/material.dart';

class VocabularyScreen extends StatelessWidget {
  const VocabularyScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '語彙 (Kosa Kata)',
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
                        title: 'Contoh 1: Kata Benda',
                        japanese: '本 (ほん)',
                        meaning: 'Buku',
                        example: '私は本を読みます。',
                        exampleMeaning: 'Saya membaca buku.',
                      ),
                      const SizedBox(height: 16),
                      _buildExampleCard(
                        title: 'Contoh 2: Kata Kerja',
                        japanese: '食べる (たべる)',
                        meaning: 'Makan',
                        example: '朝ごはんを食べます。',
                        exampleMeaning: 'Saya makan sarapan.',
                      ),
                      const SizedBox(height: 16),
                      _buildExampleCard(
                        title: 'Contoh 3: Kata Sifat',
                        japanese: '大きい (おおきい)',
                        meaning: 'Besar',
                        example: 'この家は大きいです。',
                        exampleMeaning: 'Rumah ini besar.',
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
    required String japanese,
    required String meaning,
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
              color: Color(0xFF10B981),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            japanese,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            meaning,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF6B7280),
            ),
          ),
          const Divider(height: 24),
          Text(
            example,
            style: const TextStyle(
              fontSize: 16,
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
