class VocabularyModel {
  final int id;
  final String word;
  final String reading;
  final String meaning;
  final String type; // noun, verb, adjective, etc.
  final List<String> examples;

  VocabularyModel({
    required this.id,
    required this.word,
    required this.reading,
    required this.meaning,
    required this.type,
    required this.examples,
  });
}
