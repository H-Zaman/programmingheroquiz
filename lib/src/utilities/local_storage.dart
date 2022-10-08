import 'package:get_storage/get_storage.dart';

class LocalStorage{
  final GetStorage _storage = GetStorage();
  static Future<void> initialize() async{
    await GetStorage.init();
  }

  Future<void> saveHighScore (int newScore) async => await _storage.write(_StorageKeys.highestScoreInfo, newScore);

  int getHighScore() {
    if(!_storage.hasData(_StorageKeys.highestScoreInfo)) return 0;

    return _storage.read<int>(_StorageKeys.highestScoreInfo) ?? 0;
  }

}

class _StorageKeys{
  _StorageKeys._();

  static const highestScoreInfo = 'user_highest_score_info';
}