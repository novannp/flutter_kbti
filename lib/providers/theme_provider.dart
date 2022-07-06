import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/themes.dart';

class ThemeProvider with ChangeNotifier {
  String currentTheme = 'system';
  ThemeMode get themeMode {
    if (currentTheme == 'light') {
      return ThemeMode.light;
    } else if (currentTheme == 'dark') {
      return ThemeMode.light;
    } else {
      return ThemeMode.system;
    }
  }

  changeTheme(String theme) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('theme', theme);
    currentTheme = theme;
    notifyListeners();
  }

  getCurrentTheme() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    currentTheme = _prefs.getString('theme') ?? 'system';
    notifyListeners();
  }
}