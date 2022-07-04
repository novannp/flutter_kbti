import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color blueColor = const Color(0xff1d2a57);
Color greyColor = const Color(0xffdadce0);
Color bgChipColor = const Color(0xfff2f7ff);
Color blueDarkColor = const Color(0xFF08133A);

bool isDarkMode = false;

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff23272a),
    ),
    dialogTheme: DialogTheme(
        backgroundColor: const Color(0xff23272a),
        titleTextStyle: GoogleFonts.lato(color: Colors.white),
        contentTextStyle: GoogleFonts.lato(
          color: Colors.white,
        )),
    dividerColor: Colors.grey,
    scaffoldBackgroundColor: const Color(0xff2C2F33),
    cardColor: const Color(0xff23272a),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.lato(color: Colors.white),
    ),
    textTheme: TextTheme(
        subtitle1: GoogleFonts.lato(),
        bodyText2: GoogleFonts.lato(
          color: const Color.fromARGB(255, 233, 233, 233),
        )));

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(backgroundColor: blueColor),
);
