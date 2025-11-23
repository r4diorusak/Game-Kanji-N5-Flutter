class KanjiModel {
  final int id;
  final String character;
  final String meaning;
  final String kunyomi;
  final String? onyomi;
  final int strokes;
  final List<String> examples;

  KanjiModel({
    required this.id,
    required this.character,
    required this.meaning,
    required this.kunyomi,
    this.onyomi,
    required this.strokes,
    required this.examples,
  });

  factory KanjiModel.fromJson(Map<String, dynamic> json) {
    return KanjiModel(
      id: json['id'] as int,
      character: json['character'] as String,
      meaning: json['meaning'] as String,
      kunyomi: json['kunyomi'] as String,
      onyomi: json['onyomi'] as String?,
      strokes: json['strokes'] as int,
      examples: List<String>.from(json['examples'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'character': character,
      'meaning': meaning,
      'kunyomi': kunyomi,
      'onyomi': onyomi,
      'strokes': strokes,
      'examples': examples,
    };
  }
}
