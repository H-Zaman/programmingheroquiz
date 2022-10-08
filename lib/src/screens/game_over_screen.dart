import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programmingheroquiz/src/controllers/score_controller.dart';
import 'package:programmingheroquiz/src/screens/home_screen.dart';
import 'package:programmingheroquiz/src/utilities/resources/resources.dart';
import 'package:programmingheroquiz/src/widgets/widgets.dart';

class GameOverScreen extends StatefulWidget {
  const GameOverScreen({Key? key}) : super(key: key);

  @override
  State<GameOverScreen> createState() => _GameOverScreenState();
}

class _GameOverScreenState extends State<GameOverScreen> {

  ScoreController scoreController = Get.find();

  int userScore = 0;
  int highestScore = 0;

  @override
  void initState() {
    userScore = scoreController.currentScore.value;
    highestScore = scoreController.userHighestScore.value;
    super.initState();
    /// checking and setting highest score
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scoreController.setNewHighScore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Score',
              style: AppTextStyle.medium(
                fontSize: 20
              )
            ),
            Text(
              '$userScore Point',
              style: AppTextStyle.medium(
                fontSize: 32
              )
            ),

            SizedBox(height: 24),
            if(userScore > highestScore)Text(
              'New highscore achieved!\nCongratulations',
              textAlign: TextAlign.center,
              style: AppTextStyle.medium(
                fontSize: 16
              )
            ),

            SizedBox(height: 42),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: CButton(
                onPressed: (){
                  Get.offAll(()=>HomeScreen());
                },
                label: 'Home',
              ),
            )
          ],
        )
      ),
    );
  }
}
