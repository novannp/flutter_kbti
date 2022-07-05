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
      body: Center(
        child: Text(
          'SOON',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
