import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/themes.dart';

AppBar buildAppBar(String title) {
  return AppBar(
      backgroundColor: isDarkMode ? Color(0xff23272a) : blueColor,
      elevation: 2,
      title: title == ''
          ? Image.asset(
              'assets/images/logo.png',
              height: 30,
            )
          : Text(
              title,
              style: GoogleFonts.lato(fontSize: 20),
            ));
}
