import 'dart:developer';

import 'package:get/get.dart';
import 'package:programmingheroquiz/src/model/quiz.dart';

class QuizRepository{

  Future<List<Quiz>> getAllQuiz() async{
    try{

      final response = await GetHttpClient(
        baseUrl: 'https://herosapp.nyc3.digitaloceanspaces.com'
      ).get('/quiz.json');

      return List<Quiz>.from(response.body['questions'].map((quiz) => Quiz.fromJson(quiz)));

    }catch(err){
      log(err.toString());
      return [];
    }
  }

}