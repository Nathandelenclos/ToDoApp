import 'package:flutter/material.dart';
import 'package:todo/app/constants/style.dart';
import 'package:todo/utils/theme/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  AppTheme get currentTheme => _isDarkMode ? darkAppTheme : lightAppTheme;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
