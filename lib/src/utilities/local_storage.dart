import 'package:get_storage/get_storage.dart';

class LocalStorage{
  final GetStorage _storage = GetStorage();
  static Future<void> initialize() async{
    await GetStorage.init();
  }


}

class _StorageKeys{
  _StorageKeys._();

  static const scoreInfo = 'user_score_info';
}