class GrammarModel {
  final int id;
  final String pattern;
  final String meaning;
  final String explanation;
  final List<String> examples;

  GrammarModel({
    required this.id,
    required this.pattern,
    required this.meaning,
    required this.explanation,
    required this.examples,
  });
}
