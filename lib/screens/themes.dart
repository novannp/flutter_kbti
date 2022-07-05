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
    listTileTheme: ListTileThemeData(iconColor: Colors.white),
    dialogTheme: DialogTheme(
        backgroundColor: const Color(0xff23272a),
        titleTextStyle: GoogleFonts.lato(color: Colors.white),
        contentTextStyle: GoogleFonts.lato(
          color: Colors.white,
        )),
    dividerColor: Colors.grey,
    iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: const Color(0xff2C2F33),
    cardColor: const Color(0xff23272a),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.lato(color: Colors.white),
    ),
    textTheme: TextTheme(
        subtitle1: GoogleFonts.lato(),
        headline1: GoogleFonts.lato(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color: Colors.white60,
        ),
        headline3: GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        headline4: GoogleFonts.lato(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.white,
        ),
        bodyText1: GoogleFonts.lato(fontSize: 16, color: Colors.white),
        bodyText2: GoogleFonts.lato(
          color: const Color.fromARGB(255, 233, 233, 233),
        )));

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(backgroundColor: blueColor),
  iconTheme: IconThemeData(color: blueColor),
  listTileTheme: ListTileThemeData(iconColor: blueColor),
  textTheme: TextTheme(
    headline1: GoogleFonts.lato(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: blueColor,
    ),
    headline3: GoogleFonts.lato(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline4: GoogleFonts.lato(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.black,
    ),
    bodyText1: GoogleFonts.lato(fontSize: 16, color: blueColor),
    subtitle1: GoogleFonts.lato(),
  ),
);
