import 'package:shared_preferences/shared_preferences.dart';


const PREF_KEY_THEME_MODE = 'themeMode';



class MultiThemeRepository {
  // getMultiTheme(): VM経由しないので、staticで定義して変数代入
  static bool themeStatus = false;


  // Future<bool> changeMultiTheme(bool isMultiTheme) async {
  Future<void> changeMultiTheme(bool isMultiThemeMode) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    // return _prefs.setBool(PREF_KEY_THEME_MODE, isMultiTheme);
    await _prefs.setBool(PREF_KEY_THEME_MODE, isMultiThemeMode);
    themeStatus = isMultiThemeMode;
  }

  Future<void> getMultiTheme() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    themeStatus = _prefs.getBool(PREF_KEY_THEME_MODE) ?? true;
  }
}
