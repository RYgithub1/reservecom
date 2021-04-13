import 'package:flutter/material.dart';
import 'package:reservecom/model/multi_theme_repository.dart';



class MultiThemeViewModel extends ChangeNotifier {
  final MultiThemeRepository _multiThemeRepository = MultiThemeRepository();

  bool _isMultiTheme = true;
  bool get isMultiTheme =>  _isMultiTheme;


  void changeMultiTheme(bool isMultiTheme) {
    _multiThemeRepository.changeMultiTheme(isMultiTheme);
  }
}
