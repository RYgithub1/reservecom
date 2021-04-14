import 'package:shared_preferences/shared_preferences.dart';



const PREF_KEY_THEME_MODE = 'themeMode';


class MultiThemeRepository {

  // Future<bool> changeMultiTheme(bool isMultiTheme) async {
  Future<void> changeMultiTheme(bool isMultiThemeMode) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    // return _prefs.setBool(PREF_KEY_THEME_MODE, isMultiTheme);
    _prefs.setBool(PREF_KEY_THEME_MODE, isMultiThemeMode);
  }




}