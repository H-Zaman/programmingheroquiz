import 'package:get/get.dart';
import 'package:programmingheroquiz/src/controllers/quiz_controller.dart';
import 'package:programmingheroquiz/src/controllers/score_controller.dart';
import 'package:programmingheroquiz/src/repository/quiz_repository.dart';
import 'package:programmingheroquiz/src/utilities/local_storage.dart';

class RootBindings extends Bindings{
  @override
  void dependencies() {
    // Helpers
    Get.put(LocalStorage());

    // Repositories
    Get.put(QuizRepository());

    // Controllers
    Get.put(ScoreController());
    Get.put(QuizController());
  }

}