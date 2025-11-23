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
  GrammarModel(
    id: 6,
    pattern: '〜か',
    meaning: 'Apakah ...? (Partikel Tanya)',
    explanation: 'Partikel か diletakkan di akhir kalimat untuk mengubahnya menjadi kalimat tanya.',
    examples: [
      '学生ですか (がくせいですか) - Apakah Anda pelajar?',
      'これは何ですか (これはなんですか) - Apa ini?',
      '元気ですか (げんきですか) - Apa kabar?',
    ],
  ),
  GrammarModel(
    id: 7,
    pattern: '〜も',
    meaning: '... juga',
    explanation: 'Menggantikan partikel は, が, atau を untuk menunjukkan arti "juga" atau "pun".',
    examples: [
      '私も学生です (わたしもがくせいです) - Saya juga pelajar',
      'これもください (これもください) - Tolong ini juga',
      '彼も行きます (かれもいきます) - Dia juga pergi',
    ],
  ),
  GrammarModel(
    id: 8,
    pattern: '〜の',
    meaning: '... milik ... / ... dari ...',
    explanation: 'Menghubungkan dua kata benda, seringkali menunjukkan kepemilikan atau atribut.',
    examples: [
      '私の本 (わたしのほん) - Buku saya',
      '日本語の先生 (にほんごのせんせい) - Guru bahasa Jepang',
      '東京の大学 (とうきょうのだいがく) - Universitas di Tokyo',
    ],
  ),
  GrammarModel(
    id: 9,
    pattern: '〜ませんか',
    meaning: 'Maukah ...? / Bagaimana kalau ...?',
    explanation: 'Digunakan untuk mengajak seseorang melakukan sesuatu dengan sopan.',
    examples: [
      '一緒に行きませんか (いっしょにいきませんか) - Maukah pergi bersama?',
      'コーヒーを飲みませんか (こーひーをのみませんか) - Maukah minum kopi?',
      '映画を見ませんか (えいがをみませんか) - Maukah menonton film?',
    ],
  ),
  GrammarModel(
    id: 10,
    pattern: '〜ましょう',
    meaning: 'Ayo ...',
    explanation: 'Digunakan untuk mengajak atau menyarankan melakukan sesuatu bersama-sama.',
    examples: [
      '食べましょう (たべましょう) - Ayo makan',
      '勉強しましょう (べんきょうしましょう) - Ayo belajar',
      '帰りましょう (かえりましょう) - Ayo pulang',
    ],
  ),
  GrammarModel(
    id: 11,
    pattern: '〜があります/います',
    meaning: 'Ada ... di ...',
    explanation: 'あります digunakan untuk benda mati, sedangkan います digunakan untuk makhluk hidup (orang/hewan).',
    examples: [
      '机の上に本があります (つくえのうえにほんがあります) - Ada buku di atas meja',
      '教室に学生がいます (きょうしつにがくせいがいます) - Ada murid di kelas',
      'あそこに犬がいます (あそこにいぬがいます) - Ada anjing di sana',
    ],
  ),
  GrammarModel(
    id: 12,
    pattern: '〜たいです',
    meaning: 'Ingin ...',
    explanation: 'Menyatakan keinginan pembicara untuk melakukan sesuatu. Menggunakan bentuk Masu tanpa "masu" + tai desu.',
    examples: [
      '日本へ行きたいです (にほんへいきたいです) - Saya ingin pergi ke Jepang',
      '水を飲みたいです (みずをのみたいです) - Saya ingin minum air',
      '寿司を食べたいです (すしをたべたいです) - Saya ingin makan sushi',
    ],
  ),
  GrammarModel(
    id: 13,
    pattern: '〜てください',
    meaning: 'Tolong ...',
    explanation: 'Digunakan untuk meminta atau mempersilakan seseorang melakukan sesuatu. Menggunakan kata kerja bentuk-Te.',
    examples: [
      '書いてください (かいてください) - Tolong tulis',
      '聞いてください (きいてください) - Tolong dengarkan',
      'ちょっと待ってください (ちょっとまってください) - Tolong tunggu sebentar',
    ],
  ),
  GrammarModel(
    id: 14,
    pattern: '〜てもいいですか',
    meaning: 'Bolehkah ...?',
    explanation: 'Digunakan untuk meminta izin melakukan sesuatu.',
    examples: [
      '写真を撮ってもいいですか (しゃしんをとってもいいですか) - Bolehkah mengambil foto?',
      'ここに座ってもいいですか (ここにすわってもいいですか) - Bolehkah duduk di sini?',
      '入ってもいいですか (はいってもいいですか) - Bolehkah masuk?',
    ],
  ),
  GrammarModel(
    id: 15,
    pattern: '〜てはいけません',
    meaning: 'Tidak boleh ...',
    explanation: 'Digunakan untuk menyatakan larangan atau aturan.',
    examples: [
      'ここでタバコを吸ってはいけません (ここでたばこをすってはいけません) - Tidak boleh merokok di sini',
      '英語で話してはいけません (えいごではなしてはいけません) - Tidak boleh bicara bahasa Inggris',
      '写真を撮ってはいけません (しゃしんをとってはいけません) - Tidak boleh mengambil foto',
    ],
  ),
  GrammarModel(
    id: 16,
    pattern: '〜から',
    meaning: 'Karena ...',
    explanation: 'Menunjukkan alasan atau sebab. Diletakkan setelah kalimat alasan.',
    examples: [
      '忙しいから、行きません (いそがしいから、いきません) - Karena sibuk, saya tidak pergi',
      '好きだから、買いました (すきだから、かいました) - Karena suka, saya membelinya',
      '雨ですから、傘がいります (あめですから、かさがいります) - Karena hujan, perlu payung',
    ],
  ),
  GrammarModel(
    id: 17,
    pattern: '〜ないでください',
    meaning: 'Tolong jangan ...',
    explanation: 'Digunakan untuk melarang atau meminta seseorang untuk tidak melakukan sesuatu dengan sopan.',
    examples: [
      '行かないでください (いかないでください) - Tolong jangan pergi',
      '忘れないでください (わすれないでください) - Tolong jangan lupa',
      '心配しないでください (しんぱいしないでください) - Tolong jangan khawatir',
    ],
  ),
  GrammarModel(
    id: 18,
    pattern: '〜のが上手/下手です',
    meaning: 'Pandai/Tidak pandai dalam ...',
    explanation: 'Menyatakan kemahiran atau ketidakmahiran dalam melakukan suatu kegiatan. Kata kerja diubah menjadi kata benda dengan partikel の.',
    examples: [
      '歌うのが上手です (うたうのがじょうずです) - Pandai menyanyi',
      '料理を作るのが下手です (りょうりをつくるのがへたです) - Tidak pandai memasak',
      '絵を描くのが好きです (えをかくのがすきです) - Suka menggambar',
    ],
  ),
  GrammarModel(
    id: 19,
    pattern: '〜前に',
    meaning: 'Sebelum ...',
    explanation: 'Menyatakan urutan waktu, melakukan sesuatu sebelum hal lain.',
    examples: [
      '寝る前に歯を磨きます (ねるまえにはをみがきます) - Menggosok gigi sebelum tidur',
      '食事の前に手を洗います (しょくじのまえにてをあらいます) - Mencuci tangan sebelum makan',
      '日本へ来る前に日本語を勉強しました (にほんへくるまえににほんごをべんきょうしました) - Belajar bahasa Jepang sebelum datang ke Jepang',
    ],
  ),
  GrammarModel(
    id: 20,
    pattern: '〜たことがあります',
    meaning: 'Pernah ...',
    explanation: 'Menyatakan pengalaman di masa lalu. Menggunakan kata kerja bentuk-Ta.',
    examples: [
      '日本へ行ったことがあります (にほんへいったことがあります) - Saya pernah pergi ke Jepang',
      '寿司を食べたことがあります (すしをたべたことがあります) - Saya pernah makan sushi',
      '富士山に登ったことがありますか (ふじさんにのぼったことがありますか) - Apakah pernah mendaki Gunung Fuji?',
    ],
  ),
];
