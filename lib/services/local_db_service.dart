import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDBService extends GetxService {
  static LocalDBService get instance => Get.find();

  /// instances
  late SharedPreferences _sharedPre;

  /// [initDb] -- prepare the local storage / database for this app
  Future<LocalDBService> initDb() async {
    _sharedPre = await SharedPreferences.getInstance();
    return this;
  }

  /// [setString] -- set String
  Future<bool> setString({
    required String value,
    required String key,
  }) async {
    final _ = await _sharedPre.setString(key, value);
    return _;
  }

  /// [getString] -- get String
  String? getString(String key) {
    final _ = _sharedPre.getString(key);
    return _;
  }

  /// [setBool] -- set Bool
  Future<bool> setBool({
    required bool value,
    required String key,
  }) async {
    final _ = await _sharedPre.setBool(key, value);
    return _;
  }

  /// [getString] -- get String
  bool? getBool(String key) {
    final _ = _sharedPre.getBool(key);
    return _;
  }
}
