class VerbModel {
  final String dictionary; // Bentuk Kamus (u-form)
  final String meaning;
  final int group; // 1: Godan, 2: Ichidan, 3: Irregular

  const VerbModel({
    required this.dictionary,
    required this.meaning,
    required this.group,
  });
}

final List<VerbModel> verbData = [
  // Group 1 (Godan)
  VerbModel(dictionary: 'あう', meaning: 'bertemu', group: 1),
  VerbModel(dictionary: 'いく', meaning: 'pergi', group: 1),
  VerbModel(dictionary: 'はなす', meaning: 'berbicara', group: 1),
  VerbModel(dictionary: 'まつ', meaning: 'menunggu', group: 1),
  VerbModel(dictionary: 'しぬ', meaning: 'mati', group: 1),
  VerbModel(dictionary: 'よむ', meaning: 'membaca', group: 1),
  VerbModel(dictionary: 'つくる', meaning: 'membuat', group: 1),
  VerbModel(dictionary: 'およぐ', meaning: 'berenang', group: 1),
  VerbModel(dictionary: 'あそぶ', meaning: 'bermain', group: 1),
  VerbModel(dictionary: 'かう', meaning: 'membeli', group: 1),
  VerbModel(dictionary: 'かく', meaning: 'menulis', group: 1),
  VerbModel(dictionary: 'きく', meaning: 'mendengar', group: 1),
  VerbModel(dictionary: 'のむ', meaning: 'minum', group: 1),
  VerbModel(dictionary: 'はしる', meaning: 'berlari', group: 1),
  VerbModel(dictionary: 'うる', meaning: 'menjual', group: 1),
  VerbModel(dictionary: 'ある', meaning: 'ada (benda)', group: 1),
  VerbModel(dictionary: 'わかる', meaning: 'mengerti', group: 1),
  VerbModel(dictionary: 'とる', meaning: 'mengambil', group: 1),
  VerbModel(dictionary: 'のる', meaning: 'naik (kendaraan)', group: 1),
  VerbModel(dictionary: 'やる', meaning: 'melakukan', group: 1),
  VerbModel(dictionary: 'すわる', meaning: 'duduk', group: 1),
  VerbModel(dictionary: 'たつ', meaning: 'berdiri', group: 1),
  VerbModel(dictionary: 'すう', meaning: 'merokok/menghisap', group: 1),
  VerbModel(dictionary: 'つかう', meaning: 'menggunakan', group: 1),
  VerbModel(dictionary: 'てつだう', meaning: 'membantu', group: 1),
  VerbModel(dictionary: 'はいる', meaning: 'masuk', group: 1),
  VerbModel(dictionary: 'もつ', meaning: 'membawa', group: 1),
  VerbModel(dictionary: 'やすむ', meaning: 'istirahat', group: 1),
  VerbModel(dictionary: 'よぶ', meaning: 'memanggil', group: 1),
  VerbModel(dictionary: 'かえる', meaning: 'pulang', group: 1), // Pengecualian (masuk Group 1)
  VerbModel(dictionary: 'きる', meaning: 'memotong', group: 1), // Pengecualian (masuk Group 1)
  VerbModel(dictionary: 'しる', meaning: 'tahu', group: 1), // Pengecualian (masuk Group 1)

  // Group 2 (Ichidan)
  VerbModel(dictionary: 'たべる', meaning: 'makan', group: 2),
  VerbModel(dictionary: 'みる', meaning: 'melihat', group: 2),
  VerbModel(dictionary: 'ねる', meaning: 'tidur', group: 2),
  VerbModel(dictionary: 'おきる', meaning: 'bangun', group: 2),
  VerbModel(dictionary: 'いる', meaning: 'ada (orang)', group: 2),
  VerbModel(dictionary: 'あける', meaning: 'membuka', group: 2),
  VerbModel(dictionary: 'しめる', meaning: 'menutup', group: 2),
  VerbModel(dictionary: 'おしえる', meaning: 'mengajar', group: 2),
  VerbModel(dictionary: 'わすれる', meaning: 'lupa', group: 2),
  VerbModel(dictionary: 'おりる', meaning: 'turun', group: 2),
  VerbModel(dictionary: 'かりる', meaning: 'meminjam', group: 2),
  VerbModel(dictionary: 'つける', meaning: 'menyalakan', group: 2),
  VerbModel(dictionary: 'シャワーをあびる', meaning: 'mandi', group: 2),
  VerbModel(dictionary: 'きる', meaning: 'memakai (baju)', group: 2),
  VerbModel(dictionary: 'でる', meaning: 'keluar', group: 2),
  VerbModel(dictionary: 'みせる', meaning: 'memperlihatkan', group: 2),
  VerbModel(dictionary: 'おぼえる', meaning: 'mengingat', group: 2),

  // Group 3 (Irregular)
  VerbModel(dictionary: 'する', meaning: 'melakukan', group: 3),
  VerbModel(dictionary: 'くる', meaning: 'datang', group: 3),
  VerbModel(dictionary: 'べんきょうする', meaning: 'belajar', group: 3),
  VerbModel(dictionary: 'そうじする', meaning: 'membersihkan', group: 3),
  VerbModel(dictionary: 'せんたくする', meaning: 'mencuci baju', group: 3),
  VerbModel(dictionary: 'さんぽする', meaning: 'jalan-jalan', group: 3),
  VerbModel(dictionary: 'けっこんする', meaning: 'menikah', group: 3),
  VerbModel(dictionary: 'かいものする', meaning: 'berbelanja', group: 3),
];
