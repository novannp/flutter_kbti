import 'package:flutter/material.dart';
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch(
        activeColor: Colors.white,
        value: themeProvider.isDarkModeOn,
        onChanged: (value) {
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          provider.toggleTheme(value);
          setState(() {});
        });
  }
}
