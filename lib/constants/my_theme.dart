import 'package:flutter/material.dart';

class MyTheme {
  static const MaterialColor myTheme =
      MaterialColor(_myThemePrimaryValue, <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(_myThemePrimaryValue),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  });
  static const int _myThemePrimaryValue = 0xFFFFFFFF;

  static const MaterialColor myThemeAccent =
      MaterialColor(_myThemeAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_myThemeAccentValue),
    400: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
  });
  static const int _myThemeAccentValue = 0xFFFFFFFF;
}
