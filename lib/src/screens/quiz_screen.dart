import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programmingheroquiz/src/controllers/quiz_controller.dart';
import 'package:programmingheroquiz/src/controllers/score_controller.dart';
import 'package:programmingheroquiz/src/utilities/resources/resources.dart';
import 'package:programmingheroquiz/src/widgets/widgets.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  QuizController quizController = Get.find();
  ScoreController scoreController = Get.find();

  @override
  void initState() {
    super.initState();
    quizController.startQuiz();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(()=>Column(
          children: [

            /// score section
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 32,vertical: 6),
              margin: EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    'Question: ${quizController.allQuiz.indexOf(quizController.quiz)+1}/${quizController.allQuiz.length}',
                    style: AppTextStyle.medium(
                      color: AppColor.background,
                      fontSize: 20
                    ),
                  ),

                  Text(
                    'Score: ${scoreController.currentScore.value}',
                    style: AppTextStyle.medium(
                      color: AppColor.background,
                      fontSize: 20
                    ),
                  ),

                ],
              ),
            ),

            /// quiz
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)
                ),
                padding: EdgeInsets.all(20),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          '${quizController.quiz.score} Point',
                          style: AppTextStyle.bold(
                            color: AppColor.background,
                            fontSize: 20
                          ),
                        ),

                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            child: CachedNetworkImage(
                              imageUrl: quizController.quiz.questionImageUrl ?? '',
                              progressIndicatorBuilder: (_,__,progress) => Loader(value: progress.progress, color: AppColor.background),
                              errorWidget: (_,__,___) => Image.asset(Images.logo),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Text(
                          quizController.quiz.question,
                          style: AppTextStyle.medium(
                            color: AppColor.background,
                            fontSize: 18
                          ),
                        ),

                      ],
                    ),
                    if(quizController.isTimerActive) Positioned(
                      right: 0,
                      top: 0,
                      child: Stack(
                        children: [
                          CircularProgressIndicator(
                            color: AppColor.background,
                            value: quizController.time.value/10,
                            strokeWidth: 6,
                            backgroundColor: Colors.red,
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Center(
                              child: Text(
                                '${quizController.time.value}s',
                                style: AppTextStyle.normal(
                                  fontSize: 12,
                                  color: AppColor.background
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            /// answer list
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 14
              ),
              child: Column(
                children: quizController.quiz.answers.keys.map((answerKey) => Obx(()=>_AnswerButton(
                  onPressed: quizController.onAnswerClick,
                  answerOption: quizController.quiz.answers[answerKey],
                  selectedAnswer: quizController.selectedAnswer.value,
                  correctAnswer: quizController.quiz.answers[quizController.quiz.correctAnswer]
                ))).toList()
              ),
            )
          ],
        )),
      ),
    );
  }
}

class _AnswerButton extends StatelessWidget {
  final String answerOption;
  final Function(String) onPressed;
  final String selectedAnswer;
  final String correctAnswer;
  const _AnswerButton({
    Key? key,
    required this.onPressed,
    required this.answerOption,
    required this.selectedAnswer,
    required this.correctAnswer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(selectedAnswer.isNotEmpty) return ;
        onPressed.call(answerOption);
      },
      child: Stack(
        children: [
          Container(
            height: 42,
            width: Get.width * .7,
            margin: EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: selectedAnswer.isNotEmpty ? correctAnswer == answerOption ? Colors.green : selectedAnswer == answerOption ? Colors.red : Colors.white : Colors.white,
                width: 4
              )
            ),
            child: Center(
              child: Text(
                answerOption,
                style: AppTextStyle.medium(
                  fontSize: 16,
                  color: AppColor.background
                ),
              ),
            ),
          ),
          if(selectedAnswer == answerOption) Positioned(
            right: 12,
            top: 0,
            bottom: 12,
            child: Icon(
              CupertinoIcons.check_mark,
              size: 18,
            ),
          )
        ],
      ),
    );
  }
}
