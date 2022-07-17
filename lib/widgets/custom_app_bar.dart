import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar buildAppBar(String title) {
  return AppBar(
    elevation: 2,
    title: title == ''
        ? Image.asset(
            'assets/images/logo.png',
            height: 30,
          )
        : Text(
            title,
            style: GoogleFonts.lato(fontSize: 20),
          ),
  );
}


AppBar buildAppBarWithActions(String title, List<Widget>? action) {
  return AppBar(
    elevation: 2,
    title: title == ''
        ? Image.asset(
            'assets/images/logo.png',
            height: 30,
          )
        : Text(
            title,
            style: GoogleFonts.lato(fontSize: 20),
          ),
          actions: action,
  );
}
