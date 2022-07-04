import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbti_app/screens/themes.dart';
import 'package:kbti_app/widgets/custom_app_bar.dart';
import 'package:kbti_app/widgets/switch_dark_mode.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Pengaturan'),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 14, left: 14, right: 14, bottom: 8),
            child: Text(
              'TAMPILAN',
              style:
                  GoogleFonts.lato(color: isDarkMode ? greyColor : blueColor),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dark_mode,
                color: isDarkMode ? Colors.white : blueColor),
            title: Text(
              'Dark mode',
              style: GoogleFonts.lato(
                  color: isDarkMode ? Colors.white : blueColor),
            ),
            trailing: const SwitchDarkMode(),
          ),
        ],
      ),
    );
  }
}
