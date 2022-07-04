import 'package:flutter/material.dart';
import '../screens/themes.dart';

import '../prefs/theme_preference.dart';

class ThemeProvider with ChangeNotifier {
  ThemePreference preference = ThemePreference();
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkModeOn => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    preference.setTheme(isOn);
    notifyListeners();
  }
}
