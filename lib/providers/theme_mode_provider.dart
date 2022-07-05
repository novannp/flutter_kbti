import 'package:flutter/material.dart';
import '../screens/themes.dart';

import '../prefs/theme_preference.dart';

class ThemeProvider with ChangeNotifier {
  ThemePreference preference = ThemePreference();
  ThemeMode themeMode = ThemeMode.light;
  bool _isDarkModeOn = false;
  bool get isDarkModeOn => _isDarkModeOn;

  void toggleTheme(bool isOn) {
    _isDarkModeOn = isOn;
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    preference.setTheme(isOn);
    notifyListeners();
  }

  void getPreferences() async {
    _isDarkModeOn = await preference.getTheme();
    notifyListeners();
  }
}
