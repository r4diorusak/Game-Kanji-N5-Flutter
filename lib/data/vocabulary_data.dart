import '../models/vocabulary_model.dart';

final List<VocabularyModel> vocabularyData = [
  VocabularyModel(
    id: 1,
    word: '本',
    reading: 'ほん',
    meaning: 'Buku',
    type: 'Kata Benda',
    examples: [
      '本を読む (ほんをよむ) - membaca buku',
      '図書館で本を借りる (としょかんでほんをかりる) - meminjam buku di perpustakaan',
      'この本は面白い (このほんはおもしろい) - buku ini menarik',
    ],
  ),
  VocabularyModel(
    id: 2,
    word: '食べる',
    reading: 'たべる',
    meaning: 'Makan',
    type: 'Kata Kerja',
    examples: [
      'ご飯を食べる (ごはんをたべる) - makan nasi',
      '朝ごはんを食べます (あさごはんをたべます) - makan sarapan',
      '何を食べますか (なにをたべますか) - makan apa?',
    ],
  ),
  VocabularyModel(
    id: 3,
    word: '大きい',
    reading: 'おおきい',
    meaning: 'Besar',
    type: 'Kata Sifat-i',
    examples: [
      '大きい家 (おおきいいえ) - rumah besar',
      'この犬は大きいです (このいぬはおおきいです) - anjing ini besar',
      '大きい声で話す (おおきいこえではなす) - berbicara dengan suara keras',
    ],
  ),
  VocabularyModel(
    id: 4,
    word: '学校',
    reading: 'がっこう',
    meaning: 'Sekolah',
    type: 'Kata Benda',
    examples: [
      '学校に行く (がっこうにいく) - pergi ke sekolah',
      '学校で勉強する (がっこうでべんきょうする) - belajar di sekolah',
      '学校は楽しい (がっこうはたのしい) - sekolah menyenangkan',
    ],
  ),
  VocabularyModel(
    id: 5,
    word: '見る',
    reading: 'みる',
    meaning: 'Melihat, Menonton',
    type: 'Kata Kerja',
    examples: [
      'テレビを見る (てれびをみる) - menonton TV',
      '映画を見ます (えいがをみます) - menonton film',
      '何を見ていますか (なにをみていますか) - sedang melihat apa?',
    ],
  ),
];
