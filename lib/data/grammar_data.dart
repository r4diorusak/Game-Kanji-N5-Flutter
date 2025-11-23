import '../models/grammar_model.dart';

final List<GrammarModel> grammarData = [
  GrammarModel(
    id: 1,
    pattern: '〜は〜です',
    meaning: '[Subjek] adalah [Predikat]',
    explanation: 'Pola dasar untuk menyatakan identitas atau keadaan. Partikel は (wa) menandai topik kalimat, dan です (desu) adalah kopula sopan.',
    examples: [
      '私は学生です (わたしはがくせいです) - Saya adalah pelajar',
      'これは本です (これはほんです) - Ini adalah buku',
      '田中さんは先生です (たなかさんはせんせいです) - Tanaka-san adalah guru',
    ],
  ),
  GrammarModel(
    id: 2,
    pattern: '〜を〜ます',
    meaning: '[Objek] を [Kata Kerja]',
    explanation: 'Partikel を (wo/o) menandai objek langsung dari kata kerja. Digunakan untuk menunjukkan apa yang dikenai tindakan.',
    examples: [
      '本を読みます (ほんをよみます) - Membaca buku',
      'ご飯を食べます (ごはんをたべます) - Makan nasi',
      '音楽を聞きます (おんがくをききます) - Mendengarkan musik',
    ],
  ),
  GrammarModel(
    id: 3,
    pattern: '〜に行きます',
    meaning: 'Pergi ke [Tempat]',
    explanation: 'Partikel に (ni) menunjukkan tujuan atau arah. Digunakan dengan kata kerja pergerakan seperti 行く (iku - pergi), 来る (kuru - datang).',
    examples: [
      '学校に行きます (がっこうにいきます) - Pergi ke sekolah',
      '日本に来ます (にほんにきます) - Datang ke Jepang',
      '図書館に行きました (としょかんにいきました) - Pergi ke perpustakaan (lampau)',
    ],
  ),
  GrammarModel(
    id: 4,
    pattern: '〜で〜ます',
    meaning: 'Di/Dengan [Tempat/Alat]',
    explanation: 'Partikel で (de) menunjukkan tempat terjadinya aksi atau alat yang digunakan.',
    examples: [
      '図書館で勉強します (としょかんでべんきょうします) - Belajar di perpustakaan',
      'ペンで書きます (ぺんでかきます) - Menulis dengan pena',
      '日本語で話します (にほんごではなします) - Berbicara dalam bahasa Jepang',
    ],
  ),
  GrammarModel(
    id: 5,
    pattern: '〜が好きです',
    meaning: 'Suka [Sesuatu]',
    explanation: 'Partikel が (ga) menandai subjek gramatikal. Pola ini digunakan untuk menyatakan kesukaan.',
    examples: [
      '私は音楽が好きです (わたしはおんがくがすきです) - Saya suka musik',
      '田中さんは本が好きです (たなかさんはほんがすきです) - Tanaka-san suka buku',
      '日本語が好きですか (にほんごがすきですか) - Apakah Anda suka bahasa Jepang?',
    ],
  ),
];
