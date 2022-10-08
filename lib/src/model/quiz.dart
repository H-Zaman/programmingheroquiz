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

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
    question: json["question"],
    answers: json["answers"] as Map<String, dynamic>,
    questionImageUrl: json["questionImageUrl"],
    correctAnswer: json["correctAnswer"],
    score: json["score"],
  );
}