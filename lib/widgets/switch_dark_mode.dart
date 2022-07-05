import 'package:flutter/material.dart';
import 'package:kbti_app/prefs/theme_preference.dart';
import 'package:kbti_app/screens/themes.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../providers/theme_mode_provider.dart';

class SwitchDarkMode extends StatefulWidget {
  const SwitchDarkMode({Key? key}) : super(key: key);

  @override
  State<SwitchDarkMode> createState() => _SwitchDarkModeState();
}

class _SwitchDarkModeState extends State<SwitchDarkMode> {
  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final ThemePreference prefs = ThemePreference();
    return Switch(
        activeColor: Colors.white,
        value: isDarkMode,
        onChanged: (value) {
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          provider.toggleTheme(value);
          setState(() {
            isDarkMode = value;
          });
        });
  }
}
