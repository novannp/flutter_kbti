import 'package:flutter/material.dart';
import '../screens/themes.dart';

import '../prefs/theme_preference.dart';

class ThemeProvider with ChangeNotifier {
  ThemePreference preference = ThemePreference();
  ThemeMode themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    preference.setTheme(isOn);
    notifyListeners();
  }
}
