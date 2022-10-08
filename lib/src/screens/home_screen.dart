import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programmingheroquiz/src/screens/quiz_screen.dart';
import 'package:programmingheroquiz/src/utilities/resources/resources.dart';
import 'package:programmingheroquiz/src/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Images.logo,
            width: Get.width * .8,
          ),

          Text(
            'Quiz',
            style: AppTextStyle.bold(
              fontSize: 42
            )
          ),
          SizedBox(height: 42),

          Text(
            'Highscore',
            style: AppTextStyle.medium(
              fontSize: 20
            )
          ),
          Text(
            'user_score Point',
            style: AppTextStyle.medium(
              fontSize: 20
            )
          ),

          SizedBox(height: 42),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42),
            child: CButton(
              onPressed: (){
                Get.offAll(()=>QuizScreen());
              },
              label: 'Start',
            ),
          )
        ],
      ),
    );
  }
}