import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programmingheroquiz/src/screens/home_screen.dart';
import 'package:programmingheroquiz/src/screens/quiz_screen.dart';
import 'package:programmingheroquiz/src/utilities/resources/resources.dart';
import 'package:programmingheroquiz/src/widgets/widgets.dart';

class GameOverScreen extends StatelessWidget {
  const GameOverScreen({Key? key}) : super(key: key);

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
              'user_score Point',
              style: AppTextStyle.medium(
                fontSize: 32
              )
            ),

            SizedBox(height: 24),
            Text(
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
        ),
      ),
    );
  }
}
