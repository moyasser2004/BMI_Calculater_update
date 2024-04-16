import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesHelper {
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> setInt(String key, int value) async {
    await sharedPreferences.setInt(key, value);
  }

  static Future<void> setString(String key, String value) async {
    await sharedPreferences.setString(key, value);
  }

  static Future<void> setDouble(String key, double value) async {
    await sharedPreferences.setDouble(key, value);
  }

  static int? getInt(String key) {
    return sharedPreferences.getInt(key);
  }

  static String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  static double? getDouble(String key) {
    return sharedPreferences.getDouble(key);
  }
}
