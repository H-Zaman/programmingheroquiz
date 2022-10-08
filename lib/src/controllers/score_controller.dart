import 'package:get/get.dart';
import 'package:programmingheroquiz/src/utilities/local_storage.dart';

class ScoreController extends GetxController{

  LocalStorage _localStorage = Get.find();

  RxInt userHighestScore = RxInt(0);

  RxInt currentScore = RxInt(0);

  @override
  void onInit() {
    userHighestScore(_localStorage.getHighScore());
    super.onInit();
  }

  /// at the end of when total is point is show at the end
  /// calculate the highest and save to local storage
  void setNewHighScore(){
    if(currentScore.value < userHighestScore.value){
      currentScore(0);
      return ;
    }
    userHighestScore(currentScore.value);
    _localStorage.saveHighScore(currentScore.value);
    currentScore(0);
  }

}