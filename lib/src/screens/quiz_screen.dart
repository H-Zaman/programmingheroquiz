import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programmingheroquiz/src/screens/game_over_screen.dart';
import 'package:programmingheroquiz/src/utilities/resources/resources.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    'Question: 1/100',
                    style: AppTextStyle.medium(
                      color: AppColor.background,
                      fontSize: 20
                    ),
                  ),

                  Text(
                    'Score: 123',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      '123 Point',
                      style: AppTextStyle.bold(
                        color: AppColor.background,
                        fontSize: 20
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Image.network(
                        'image_link',
                        loadingBuilder: (_,__,___) => CircularProgressIndicator(color: AppColor.background),
                        errorBuilder: (_,__,___) => SizedBox(),
                        fit: BoxFit.cover,
                      ),
                    ),

                    Text(
                      'question ?',
                      style: AppTextStyle.medium(
                        color: AppColor.background,
                        fontSize: 18
                      ),
                    ),

                  ],
                ),
              ),
            ),

            /// answer list
            Column(
              children: [
                'answer 1',
                'answer 2',
                'answer 3',
                'answer 4',
              ].map((answer) => _AnswerButton(
                onPressed: (){
                  Get.offAll(()=>GameOverScreen());
                },
                answer: answer,
                selectedAnswer: 'answer 3',
                isCorrectAnswer: answer == 'answer 1',
                quizAnswered: true,
              )).toList()
            )
          ],
        ),
      ),
    );
  }
}

class _AnswerButton extends StatelessWidget {
  final String answer;
  final VoidCallback onPressed;
  final String selectedAnswer;
  final bool isCorrectAnswer;
  final bool quizAnswered;
  const _AnswerButton({
    Key? key,
    required this.onPressed,
    required this.answer,
    required this.selectedAnswer,
    required this.isCorrectAnswer,
    required this.quizAnswered
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 42,
        width: Get.width * .7,
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: quizAnswered ? isCorrectAnswer ? Colors.green : selectedAnswer == answer ? Colors.red : Colors.white : Colors.white,
            width: 4
          )
        ),
        child: Center(
          child: Text(
            answer,
            style: AppTextStyle.medium(
              fontSize: 16,
              color: AppColor.background
            ),
          ),
        ),
      ),
    );
  }
}
