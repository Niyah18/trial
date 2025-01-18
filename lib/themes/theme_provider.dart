import 'package:flutter/material.dart';
import 'package:trial/themes/dark_mode.dart';
import 'package:trial/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme;
  bool _isDarkTheme;

  ThemeProvider()
      : _currentTheme = lightMode, // Initialize with your desired theme
        _isDarkTheme = false;

  ThemeData get themeData => _currentTheme;
  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme() {
    if (_isDarkTheme) {
      _currentTheme = lightMode;
    } else {
      _currentTheme = darkMode;
    }
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}
