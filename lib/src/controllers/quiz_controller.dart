import 'dart:async';

import 'package:get/get.dart';
import 'package:programmingheroquiz/src/controllers/score_controller.dart';
import 'package:programmingheroquiz/src/model/quiz.dart';
import 'package:programmingheroquiz/src/repository/quiz_repository.dart';
import 'package:programmingheroquiz/src/screens/game_over_screen.dart';

class QuizController extends GetxController{

  /// loading variable to show a loader while fetch quiz from API
  RxBool _loading = RxBool(true);
  bool get loading => _loading.value;

  ScoreController _scoreController = Get.find();
  QuizRepository _repository = Get.find();

  RxList<Quiz> allQuiz = RxList();
  Rxn<Quiz> _currentQuiz = Rxn();
  Quiz get quiz => _currentQuiz.value!;

  RxString selectedAnswer = RxString('');

  Timer? _timer;
  RxInt time = RxInt(10);
  bool get isTimerActive => _timer != null && _timer!.isActive;

  void startTimer(){
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      time--;
      if(time.value == 0){
        _timer!.cancel();
        time(10);
        /// when the give time 10 sec is over
        /// auto select correct answer if no answer is selected
        if(selectedAnswer.value.isEmpty){
          selectedAnswer(quiz.answers[quiz.correctAnswer]);
        }
        _setNextQuiz();
      }
    });
  }

  @override
  void onInit() {
    /// fetching all quiz from API
    _repository.getAllQuiz().then((value) {

      allQuiz(value);
      _currentQuiz(allQuiz.first);
      _loading(false);
    });
    super.onInit();
  }

  void startQuiz() {
    startTimer();
    _currentQuiz(allQuiz.first);
  }

  void onAnswerClick(String answer) async{
    /// if timer is not-active meaning
    /// given time time is over hence no answer
    /// can be selected
    if(!isTimerActive) return ;

    _timer!.cancel();
    time(10);

    selectedAnswer(answer);
    /// correct answer check
    if(quiz.answers[quiz.correctAnswer] == answer){
      _scoreController.currentScore+=quiz.score;
    }

    _setNextQuiz();

  }

  Future<void> _setNextQuiz() async{
    /// delay of 2 sec to show next quiz
    await Future.delayed(Duration(seconds: 2));
    selectedAnswer('');

    final nextQuizIndex = allQuiz.indexOf(quiz)+1;
    /// if current quiz is the last quiz show
    /// total points in the end
    if(nextQuizIndex == allQuiz.length){
      Get.offAll(()=>GameOverScreen());
    }else{
      /// set next quiz
      _currentQuiz.value = allQuiz[nextQuizIndex];
      startTimer();
    }
  }

}