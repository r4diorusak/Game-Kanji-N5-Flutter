class ChokaiQuiz {
  final String story;
  final String question;
  final List<String> options; // 4 options
  final int correctAnswerIndex; // 0-3

  ChokaiQuiz({
    required this.story,
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });

  factory ChokaiQuiz.fromJson(Map<String, dynamic> json) {
    return ChokaiQuiz(
      story: json['story'] as String,
      question: json['question'] as String,
      options: List<String>.from(json['options'] as List),
      correctAnswerIndex: json['correctAnswerIndex'] as int,
    );
  }
}
