import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static bool _isLight = true;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get isLight {
    return _prefs.getBool('isLight') ?? _isLight;
  }

  static set isLight(bool value) {
    _isLight = value;
    _prefs.setBool('isLight', value);
  }
}
