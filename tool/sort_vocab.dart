import 'dart:io';

void main() async {
  final file = File('lib/data/vocabulary_data.dart');
  if (!await file.exists()) {
    print('File not found!');
    return;
  }
  final content = await file.readAsString();

  // Regex yang lebih robust untuk menangkap blok VocabularyModel
  // Kita asumsikan formatnya konsisten seperti yang dilihat
  final regex = RegExp(
    r"VocabularyModel\(\s*id:\s*\d+,\s*word:\s*'([^']*)',\s*reading:\s*'([^']*)',\s*meaning:\s*'([^']*)',\s*type:\s*'([^']*)',\s*examples:\s*\[(.*?)\]\s*,\s*\),",
    multiLine: true,
    dotAll: true,
  );

  final matches = regex.allMatches(content);
  final List<Map<String, dynamic>> vocabList = [];

  for (final match in matches) {
    vocabList.add({
      'word': match.group(1),
      'reading': match.group(2),
      'meaning': match.group(3),
      'type': match.group(4),
      'examples': match.group(5), // Mengambil isi dalam kurung siku
    });
  }

  print('Ditemukan ${vocabList.length} item.');

  // Urutkan berdasarkan reading (kana)
  vocabList.sort((a, b) {
    return (a['reading'] as String).compareTo(b['reading'] as String);
  });

  // Tulis ulang file
  final buffer = StringBuffer();
  buffer.writeln("import '../models/vocabulary_model.dart';");
  buffer.writeln();
  buffer.writeln("final List<VocabularyModel> vocabularyData = [");

  for (var i = 0; i < vocabList.length; i++) {
    final item = vocabList[i];
    buffer.writeln("  VocabularyModel(");
    buffer.writeln("    id: ${i + 1},");
    buffer.writeln("    word: '${item['word']}',");
    buffer.writeln("    reading: '${item['reading']}',");
    buffer.writeln("    meaning: '${item['meaning']}',");
    buffer.writeln("    type: '${item['type']}',");
    // Examples sudah dalam format string raw (misal: "'contoh 1', 'contoh 2'")
    buffer.writeln("    examples: [${item['examples']}],");
    buffer.writeln("  ),");
  }

  buffer.writeln("];");

  await file.writeAsString(buffer.toString());
  print('File berhasil diperbarui dan diurutkan. Total: ${vocabList.length} item.');
}
