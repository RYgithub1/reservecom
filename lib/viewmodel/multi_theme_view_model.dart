import 'package:flutter/material.dart';
import 'package:reservecom/constant/constant.dart';
import 'package:reservecom/model/multi_theme_repository.dart';



class MultiThemeViewModel extends ChangeNotifier {
  final MultiThemeRepository _multiThemeRepository = MultiThemeRepository();

  bool _isMultiTheme = true;
  bool get isMultiTheme =>  _isMultiTheme;

  // mainでThemeをgetter -> Light/Dark themeどっち -> themeを変更する処理
  ThemeData get selectedTheme => _isMultiTheme
                                    ? multiThemeDark
                                    : multiThemeLight;


  void changeMultiTheme(bool isMultiThemeMode) async {
    // isMultiTheme = await _multiThemeRepository.changeMultiTheme(isMultiTheme);
    await _multiThemeRepository.changeMultiTheme(isMultiThemeMode);
    _isMultiTheme = isMultiThemeMode;  // 上awaitでRへセット後に確定（代入）
    notifyListeners();
  }
}
