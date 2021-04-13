// color
// theme
// font
// textStyle
// enum

import 'package:flutter/material.dart';



/// [MultiTheme]
final multiThemeLight = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

final multiThemeDark = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.dark,
  buttonColor: Colors.white30,
  primaryIconTheme: IconThemeData(color: Colors.white),
  iconTheme: IconThemeData(color: Colors.white),
);
