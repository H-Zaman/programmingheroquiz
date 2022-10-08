class Quiz {
  Quiz({
    required this.question,
    required this.answers,
    required this.questionImageUrl,
    required this.correctAnswer,
    required this.score,
  });

  String question;
  Map<String, dynamic> answers;
  String? questionImageUrl;
  String correctAnswer;
  int score;

  factory Quiz.fromJson(Map<String, dynamic> json) {

    /// randomizing answers Map
    Map<String, dynamic> original = json["answers"];

    final randomKeys = json["answers"].keys.toList()..shuffle();

    Map<String, dynamic> randomizedAnswers = {};

    for (var key in randomKeys) {
      randomizedAnswers.update(
        key,
        (existingValue) => original[key],
        ifAbsent: () => original[key]
      );
    }

    return Quiz(
      question: json["question"],
      answers: randomizedAnswers,
      questionImageUrl: json["questionImageUrl"],
      correctAnswer: json["correctAnswer"],
      score: json["score"],
    );
  }
}