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
  GrammarModel(
    id: 21,
    pattern: '〜たり〜たりします',
    meaning: 'Melakukan A, B, dll',
    explanation: 'Menyebutkan beberapa kegiatan sebagai contoh yang tidak berurutan.',
    examples: [
      '日曜日は本を読んだり、テレビを見たりします (にちようびはほんをよんだり、てれびをみたりします) - Hari Minggu saya membaca buku, menonton TV, dll.',
      '掃除したり、洗濯したりしました (そうじしたり、せんたくしたりしました) - Saya bersih-bersih, mencuci baju, dll.',
    ],
  ),
  GrammarModel(
    id: 22,
    pattern: '〜ても',
    meaning: 'Meskipun/Walaupun ...',
    explanation: 'Menyatakan pertentangan atau kondisi yang tidak mempengaruhi hasil.',
    examples: [
      '雨が降っても、行きます (あめがふっても、いきます) - Meskipun hujan, saya akan pergi',
      '高くても、買いたいです (たかくても、かいたいです) - Meskipun mahal, saya ingin membelinya',
    ],
  ),
  GrammarModel(
    id: 23,
    pattern: '〜ないで',
    meaning: 'Tanpa melakukan ...',
    explanation: 'Melakukan sesuatu tanpa melakukan hal lain yang biasanya menyertainya.',
    examples: [
      '朝ごはんを食べないで、学校へ行きました (あさごはんをたべないで、がっこうへいきました) - Pergi ke sekolah tanpa sarapan',
      '辞書を使わないで、新聞を読みます (じしょをつかわないで、しんぶんをよみます) - Membaca koran tanpa menggunakan kamus',
    ],
  ),
  GrammarModel(
    id: 24,
    pattern: '〜こと',
    meaning: 'Hal/Tentang ...',
    explanation: 'Mengubah kata kerja menjadi kata benda (nominalisasi).',
    examples: [
      '私の趣味は映画を見ることです (わたしのしゅみはえいがをみることです) - Hobi saya adalah menonton film',
      '泳ぐことができます (およぐことができます) - Bisa berenang',
    ],
  ),
  GrammarModel(
    id: 25,
    pattern: '〜時 (とき)',
    meaning: 'Saat/Ketika ...',
    explanation: 'Menunjukkan waktu terjadinya sesuatu.',
    examples: [
      '子供の時、日本にいました (こどものとき、にほんにいました) - Saat kecil, saya ada di Jepang',
      '暇な時、何をしますか (ひまなとき、なにをしますか) - Apa yang kamu lakukan saat senggang?',
    ],
  ),
  GrammarModel(
    id: 26,
    pattern: '〜ながら',
    meaning: 'Sambil ...',
    explanation: 'Melakukan dua kegiatan secara bersamaan.',
    examples: [
      '音楽を聞きながら、勉強します (おんがくをききながら、べんきょうします) - Belajar sambil mendengarkan musik',
      '歩きながら、話しましょう (あるきながら、はなしましょう) - Ayo bicara sambil jalan',
    ],
  ),
  GrammarModel(
    id: 27,
    pattern: '〜でしょう',
    meaning: 'Mungkin / ...kan?',
    explanation: 'Menyatakan perkiraan atau meminta persetujuan pendengar.',
    examples: [
      '明日は雨でしょう (あしたはあめでしょう) - Besok mungkin hujan',
      'この本は面白いでしょう (このほんはおもしろいでしょう) - Buku ini menarik, kan?',
    ],
  ),
  GrammarModel(
    id: 28,
    pattern: '〜と思います',
    meaning: 'Saya pikir ...',
    explanation: 'Menyatakan pendapat atau dugaan pribadi.',
    examples: [
      '彼は来ないと思います (かれはこないとおもいます) - Saya pikir dia tidak akan datang',
      '日本はきれいだと思います (にほんはきれいだとおもいます) - Saya pikir Jepang itu indah',
    ],
  ),
  GrammarModel(
    id: 29,
    pattern: '〜と言います',
    meaning: 'Berkata bahwa ...',
    explanation: 'Mengutip perkataan orang lain.',
    examples: [
      '田中さんは「ありがとう」と言いました (たなかさんは「ありがとう」といいました) - Tanaka-san berkata "Terima kasih"',
      '彼は明日来ると言いました (かれはあしたくるといいました) - Dia berkata bahwa besok akan datang',
    ],
  ),
  GrammarModel(
    id: 30,
    pattern: '〜という',
    meaning: 'Yang bernama/disebut ...',
    explanation: 'Menjelaskan nama atau sebutan dari sesuatu.',
    examples: [
      'ポチという犬 (ぽちといういぬ) - Anjing yang bernama Pochi',
      'これは何という花ですか (これはなんというはなですか) - Ini bunga yang disebut apa?',
    ],
  ),
  GrammarModel(
    id: 31,
    pattern: '〜ので',
    meaning: 'Karena ...',
    explanation: 'Menyatakan alasan (lebih sopan/objektif daripada "kara").',
    examples: [
      '雨なので、出かけません (あめなので、でかけません) - Karena hujan, saya tidak keluar',
      '頭が痛いので、帰ります (あたまがいたいので、かえります) - Karena sakit kepala, saya pulang',
    ],
  ),
  GrammarModel(
    id: 32,
    pattern: '〜く/〜にします',
    meaning: 'Membuat menjadi ...',
    explanation: 'Mengubah keadaan sesuatu (transitif).',
    examples: [
      '音を大きくします (おとをおおきくします) - Membesarkan suara',
      '部屋をきれいにします (へやをきれいにします) - Membersihkan kamar (membuat kamar jadi bersih)',
    ],
  ),
  GrammarModel(
    id: 33,
    pattern: '〜く/〜なります',
    meaning: 'Menjadi ...',
    explanation: 'Perubahan keadaan secara alami (intransitif).',
    examples: [
      '寒くなります (さむくなります) - Menjadi dingin',
      '医者になります (いしゃになります) - Menjadi dokter',
    ],
  ),
  GrammarModel(
    id: 34,
    pattern: '〜より〜ほうが',
    meaning: 'Lebih ... daripada ...',
    explanation: 'Membandingkan dua hal.',
    examples: [
      'バスより電車のほうが速いです (ばすよりでんしゃのほうがはやいです) - Kereta lebih cepat daripada bus',
      '肉より魚のほうが好きです (にくよりさかなのほうがすきです) - Saya lebih suka ikan daripada daging',
    ],
  ),
  GrammarModel(
    id: 35,
    pattern: '〜の中で〜が一番',
    meaning: 'Di antara ... yang paling ...',
    explanation: 'Menyatakan superlatif (paling) dalam suatu kelompok.',
    examples: [
      'スポーツの中でサッカーが一番好きです (すぽーつのなかでさっかーがいちばんすきです) - Di antara olahraga, saya paling suka sepak bola',
      'クラスの中で誰が一番背が高いですか (くらすのなかでだれがいちばんせがたかいですか) - Siapa yang paling tinggi di kelas?',
    ],
  ),
  GrammarModel(
    id: 36,
    pattern: '〜つもりです',
    meaning: 'Berencana untuk ...',
    explanation: 'Menyatakan niat atau rencana yang sudah dipikirkan.',
    examples: [
      '来年、日本へ行くつもりです (らいねん、にほんへいくつもりです) - Tahun depan saya berencana pergi ke Jepang',
      '車を買うつもりです (くるまをかうつもりです) - Saya berencana membeli mobil',
    ],
  ),
  GrammarModel(
    id: 37,
    pattern: '〜くても/〜でも',
    meaning: 'Meskipun ...',
    explanation: 'Bentuk "temo" untuk kata sifat dan kata benda.',
    examples: [
      '忙しくても、勉強します (いそがしくても、べんきょうします) - Meskipun sibuk, saya belajar',
      '日曜日でも、働きます (にちようびでも、はたらきます) - Meskipun hari Minggu, saya bekerja',
    ],
  ),
  GrammarModel(
    id: 38,
    pattern: '〜たり (Kata Benda)',
    meaning: 'Dan lain-lain',
    explanation: 'Menyebutkan beberapa contoh benda (biasanya menggunakan "ya" atau "toka").',
    examples: [
      '机の上に本やペンがあります (つくえのうえにほんやぺんがあります) - Di atas meja ada buku, pena, dll.',
      'カバンの中に財布とか鍵とかがあります (かばんのなかにさいふとかかぎとかがあります) - Di dalam tas ada dompet, kunci, dll.',
    ],
  ),
  GrammarModel(
    id: 39,
    pattern: '〜だけ',
    meaning: 'Hanya ...',
    explanation: 'Menyatakan batasan jumlah atau lingkup.',
    examples: [
      '千円だけあります (せんえんだけあります) - Hanya punya 1000 yen',
      '日曜日だけ休みます (にちようびだけやすみます) - Libur hanya hari Minggu',
    ],
  ),
  GrammarModel(
    id: 40,
    pattern: '〜しか〜ない',
    meaning: 'Hanya ... (nuansa negatif)',
    explanation: 'Menyatakan bahwa tidak ada selain yang disebutkan (selalu diikuti bentuk negatif).',
    examples: [
      '千円しかありません (せんえんしかありません) - Cuma punya 1000 yen (merasa kurang)',
      'ひらがなしか書けません (ひらがなしかかけません) - Cuma bisa menulis hiragana',
    ],
  ),
  GrammarModel(
    id: 41,
    pattern: '〜あまり〜ない',
    meaning: 'Tidak terlalu ...',
    explanation: 'Menyatakan tingkat yang rendah atau jarang (diikuti bentuk negatif).',
    examples: [
      'あまり美味しくないです (あまりおいしくないです) - Tidak terlalu enak',
      'あまりテレビを見ません (あまりてれびをみません) - Jarang menonton TV',
    ],
  ),
  GrammarModel(
    id: 42,
    pattern: '〜全然〜ない',
    meaning: 'Sama sekali tidak ...',
    explanation: 'Menyatakan penyangkalan total (diikuti bentuk negatif).',
    examples: [
      '全然わかりません (ぜんぜんわかりません) - Sama sekali tidak mengerti',
      'お金が全然ありません (おかねがぜんぜんありません) - Sama sekali tidak punya uang',
    ],
  ),
  GrammarModel(
    id: 43,
    pattern: '〜た後で',
    meaning: 'Setelah ...',
    explanation: 'Menyatakan urutan kejadian.',
    examples: [
      'ご飯を食べた後で、薬を飲みます (ごはんをたべたあとで、くすりをのみます) - Minum obat setelah makan',
      '仕事が終わった後で、飲みに行きました (しごとがおわったあとで、のみにいきました) - Pergi minum setelah pekerjaan selesai',
    ],
  ),
  GrammarModel(
    id: 44,
    pattern: '〜てから',
    meaning: 'Setelah ... (segera)',
    explanation: 'Menyatakan urutan kejadian yang berkesinambungan.',
    examples: [
      '手を洗ってから、食べます (てをあらってから、たべます) - Makan setelah mencuci tangan',
      '日本へ行ってから、着物を買いました (にほんへいってから、きものをかいました) - Membeli kimono setelah pergi ke Jepang',
    ],
  ),
  GrammarModel(
    id: 45,
    pattern: '〜方 (かた)',
    meaning: 'Cara ...',
    explanation: 'Menyatakan cara melakukan sesuatu (Kata kerja Masu + kata).',
    examples: [
      '漢字の書き方 (かんじのかきかた) - Cara menulis kanji',
      'この料理の作り方 (このりょうりのつくりかた) - Cara membuat masakan ini',
    ],
  ),
  GrammarModel(
    id: 46,
    pattern: '〜すぎます',
    meaning: 'Terlalu ...',
    explanation: 'Menyatakan tingkat yang berlebihan.',
    examples: [
      '食べすぎました (たべすぎました) - Terlalu banyak makan',
      'この服は高すぎます (このふくはたかすぎます) - Baju ini terlalu mahal',
    ],
  ),
  GrammarModel(
    id: 47,
    pattern: '〜やすいです',
    meaning: 'Mudah ...',
    explanation: 'Menyatakan kemudahan dalam melakukan sesuatu.',
    examples: [
      'このペンは書きやすいです (このぺんはかきやすいです) - Pena ini enak (mudah) dipakai menulis',
      'この本は読みやすいです (このほんはよみやすいです) - Buku ini mudah dibaca',
    ],
  ),
  GrammarModel(
    id: 48,
    pattern: '〜にくいです',
    meaning: 'Sulit/Susah ...',
    explanation: 'Menyatakan kesulitan dalam melakukan sesuatu.',
    examples: [
      'この肉は食べにくいです (このにくはたべにくいです) - Daging ini susah dimakan (keras/alot)',
      '漢字は覚えにくいです (かんじはおぼえにくいです) - Kanji susah diingat',
    ],
  ),
  GrammarModel(
    id: 49,
    pattern: '〜そうです',
    meaning: 'Kelihatannya ...',
    explanation: 'Menyatakan dugaan berdasarkan penglihatan.',
    examples: [
      '雨が降りそうです (あめがふりそうです) - Kelihatannya akan hujan',
      '美味しそうです (おいしそうです) - Kelihatannya enak',
    ],
  ),
  GrammarModel(
    id: 50,
    pattern: '〜てみます',
    meaning: 'Mencoba ...',
    explanation: 'Mencoba melakukan sesuatu untuk melihat hasilnya.',
    examples: [
      '着てみます (きてみます) - Mencoba memakai (baju)',
      '食べてみてください (たべてみてください) - Silakan coba makan',
    ],
  ),
  GrammarModel(
    id: 51,
    pattern: '〜てしまいます',
    meaning: 'Selesai / Tidak sengaja ...',
    explanation: 'Menyatakan penyelesaian total atau penyesalan karena ketidaksengajaan.',
    examples: [
      '宿題をしてしまいました (しゅくだいをしてしまいました) - Sudah menyelesaikan PR',
      'パスポートを忘れてしまいました (ぱすぽーとをわすれてしまいました) - Kelupaan bawa paspor (menyesal)',
    ],
  ),
  GrammarModel(
    id: 52,
    pattern: '〜ておきます',
    meaning: 'Melakukan ... (untuk persiapan)',
    explanation: 'Melakukan sesuatu sebagai persiapan untuk masa depan.',
    examples: [
      'ホテルを予約しておきます (ほてるをよやくしておきます) - Memesan hotel (untuk nanti)',
      '窓を開けておきます (まどをあけておきます) - Membiarkan jendela terbuka (sengaja)',
    ],
  ),
  GrammarModel(
    id: 53,
    pattern: '〜がほしい',
    meaning: 'Ingin (benda)',
    explanation: 'Menyatakan keinginan akan suatu benda.',
    examples: [
      '車がほしいです (くるマガほしいです) - Saya ingin mobil',
      '時間がほしいです (じかんがほしいです) - Saya ingin waktu',
    ],
  ),
  GrammarModel(
    id: 54,
    pattern: '〜をあげます',
    meaning: 'Memberikan',
    explanation: 'Memberikan sesuatu kepada orang lain.',
    examples: [
      '私は母に花をあげました (わたしははなにはなをあげました) - Saya memberikan bunga kepada ibu',
      '友達にプレゼントをあげます (ともだちにぷれぜんとをあげます) - Memberikan kado kepada teman',
    ],
  ),
  GrammarModel(
    id: 55,
    pattern: '〜をもらいます',
    meaning: 'Menerima',
    explanation: 'Menerima sesuatu dari orang lain.',
    examples: [
      '私は父に時計をもらいました (わたしはちちにとけいをもらいました) - Saya menerima jam tangan dari ayah',
      '先生に本をもらいました (せんせいにほんをもらいました) - Menerima buku dari guru',
    ],
  ),
  GrammarModel(
    id: 56,
    pattern: '〜をくれます',
    meaning: 'Memberikan (kepada saya)',
    explanation: 'Orang lain memberikan sesuatu kepada pembicara (saya).',
    examples: [
      '母は私に花をくれました (はははわたしにはなをくれました) - Ibu memberikan bunga kepada saya',
      '田中さんがお菓子をくれました (たなかさんがおかしをくれました) - Tanaka-san memberikan kue kepada saya',
    ],
  ),
  GrammarModel(
    id: 57,
    pattern: '〜がわかります',
    meaning: 'Mengerti / Paham',
    explanation: 'Menyatakan pemahaman.',
    examples: [
      '日本語がわかります (にほんごがわかります) - Mengerti bahasa Jepang',
      '意味がわかりますか (いみがわかりますか) - Apakah mengerti artinya?',
    ],
  ),
  GrammarModel(
    id: 58,
    pattern: '〜ができます',
    meaning: 'Bisa / Mampu',
    explanation: 'Menyatakan kemampuan atau kemungkinan.',
    examples: [
      '料理ができます (りょうりができます) - Bisa memasak',
      'スキーができますか (すきーができますか) - Apakah bisa main ski?',
    ],
  ),
  GrammarModel(
    id: 59,
    pattern: '〜ことができます',
    meaning: 'Bisa melakukan ...',
    explanation: 'Bentuk potensial formal (Kata kerja kamus + koto ga dekimasu).',
    examples: [
      '漢字を読むことができます (かんじをよむことができます) - Bisa membaca kanji',
      'ここでタバコを吸うことはできません (ここでたばこをすうことはできません) - Di sini tidak bisa (tidak boleh) merokok',
    ],
  ),
  GrammarModel(
    id: 60,
    pattern: '〜間 (あいだ)',
    meaning: 'Selama ...',
    explanation: 'Menyatakan rentang waktu berlangsungnya suatu kejadian.',
    examples: [
      '夏休みの間、国へ帰りました (なつやすみのあいだ、くにへかえりました) - Selama liburan musim panas, saya pulang kampung',
      '待っている間、本を読みました (まっているあいだ、ほんをよみました) - Selama menunggu, saya membaca buku',
    ],
  ),
  GrammarModel(
    id: 61,
    pattern: '〜までに',
    meaning: 'Menjelang / Paling lambat ...',
    explanation: 'Menyatakan batas waktu akhir (deadline).',
    examples: [
      '5時までに帰ります (5じまでにかえります) - Pulang paling lambat jam 5',
      '明日までに宿題を出してください (あしたまでにしゅくだいをだしてください) - Tolong kumpulkan PR paling lambat besok',
    ],
  ),
  GrammarModel(
    id: 62,
    pattern: '〜など',
    meaning: 'Dan lain-lain',
    explanation: 'Menyatakan contoh yang tidak lengkap.',
    examples: [
      '机の上にペンやノートなどがあります (つくえのうえにぺんやのーとなどがあります) - Di atas meja ada pena, buku catatan, dll.',
      '果物などが好きです (くだものなどがすきです) - Suka buah-buahan dll.',
    ],
  ),
  GrammarModel(
    id: 63,
    pattern: '〜ごろ',
    meaning: 'Kira-kira (Waktu)',
    explanation: 'Menyatakan perkiraan waktu tertentu.',
    examples: [
      '6時ごろ起きます (6じごろおきます) - Bangun kira-kira jam 6',
      '来月ごろ行きます (らいげつごろいきます) - Pergi kira-kira bulan depan',
    ],
  ),
  GrammarModel(
    id: 64,
    pattern: '〜ぐらい/くらい',
    meaning: 'Kira-kira (Jumlah/Durasi)',
    explanation: 'Menyatakan perkiraan jumlah atau lamanya waktu.',
    examples: [
      '1時間ぐらい勉強しました (1じかんぐらいべんきょうしました) - Belajar kira-kira 1 jam',
      '1000円ぐらいかかります (1000えんぐらいかかります) - Memakan biaya kira-kira 1000 yen',
    ],
  ),
  GrammarModel(
    id: 65,
    pattern: '〜ずつ',
    meaning: 'Masing-masing',
    explanation: 'Menyatakan pembagian yang sama rata.',
    examples: [
      '一つずつください (ひとつずつください) - Tolong satu-satu (masing-masing satu)',
      '少しずつ勉強します (すこしずつべんきょうします) - Belajar sedikit demi sedikit',
    ],
  ),
  GrammarModel(
    id: 66,
    pattern: '〜でも',
    meaning: '... atau sejenisnya / Pun',
    explanation: 'Menawarkan sesuatu sebagai contoh atau menyatakan penekanan.',
    examples: [
      'お茶でも飲みませんか (おちゃでものみませんか) - Maukah minum teh atau sejenisnya?',
      '子供でもわかります (こどもでもわかります) - Anak kecil pun mengerti',
    ],
  ),
  GrammarModel(
    id: 67,
    pattern: '〜と',
    meaning: 'Dan / Bersama / Jika',
    explanation: 'Partikel penghubung kata benda, penanda teman, atau pengandaian alami.',
    examples: [
      '私と友達 (わたしとともだち) - Saya dan teman',
      '春になると、花が咲きます (はるになると、はながさきます) - Jika musim semi tiba, bunga mekar',
    ],
  ),
  GrammarModel(
    id: 68,
    pattern: '〜や',
    meaning: 'Dan (dll)',
    explanation: 'Menyebutkan sebagian contoh dari kelompok.',
    examples: [
      '本や雑誌を読みます (ほんやざっしをよみます) - Membaca buku, majalah, dll.',
      '猫や犬が好きです (ねこやいぬがすきです) - Suka kucing, anjing, dll.',
    ],
  ),
  GrammarModel(
    id: 69,
    pattern: '〜ね',
    meaning: 'Ya? / Kan?',
    explanation: 'Partikel akhir kalimat untuk meminta persetujuan atau konfirmasi.',
    examples: [
      'いい天気ですね (いいてんきですね) - Cuaca bagus ya',
      'そうですね - Benar ya',
    ],
  ),
  GrammarModel(
    id: 70,
    pattern: '〜よ',
    meaning: 'Lho / Tahu!',
    explanation: 'Partikel akhir kalimat untuk memberi informasi baru atau penekanan.',
    examples: [
      '明日ですよ (あしたですよ) - Besok lho!',
      '違いますよ (ちがいますよ) - Salah lho!',
    ],
  ),
];
