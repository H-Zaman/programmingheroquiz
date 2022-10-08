import 'package:get/get.dart';
import 'package:programmingheroquiz/src/utilities/local_storage.dart';

class RootBindings extends Bindings{
  @override
  void dependencies() {
    // Repositories

    // Controllers

    // Helpers
    Get.put(LocalStorage());
  }

}