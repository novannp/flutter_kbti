import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

bool isDarkMode = false;
Color blueColor = const Color(0xff1d2a57);
Color greyColor = const Color(0xffdadce0);
Color bgChipColor = const Color(0xfff2f7ff);
Color blueDarkColor = const Color(0xFF08133A);

ThemeData darkTheme = ThemeData(
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Colors.white),
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff23272a),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: const Color.fromARGB(255, 44, 44, 44),
      labelStyle: GoogleFonts.lato(
        fontSize: 12,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    listTileTheme: const ListTileThemeData(iconColor: Colors.white),
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
        headline2: GoogleFonts.lato(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.white,
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
        headline5: GoogleFonts.lato(
          fontSize: 16,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        headline6: GoogleFonts.lato(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        bodyText1: GoogleFonts.lato(fontSize: 16, color: Colors.white),
        bodyText2: GoogleFonts.lato(
          color: const Color.fromARGB(255, 233, 233, 233),
        )));

ThemeData lightTheme = ThemeData(
  progressIndicatorTheme: ProgressIndicatorThemeData(color: blueColor),
  primaryColor: blueColor,
  buttonTheme: ButtonThemeData(
    buttonColor: blueColor,
  ),
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(backgroundColor: blueColor),
  chipTheme: ChipThemeData(
    backgroundColor: bgChipColor,
    labelStyle: GoogleFonts.lato(
      fontSize: 12,
      color: blueColor,
      fontWeight: FontWeight.bold,
    ),
  ),
  iconTheme: IconThemeData(color: blueColor),
  listTileTheme: ListTileThemeData(iconColor: blueColor),
  textTheme: TextTheme(
    headline1: GoogleFonts.lato(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: blueColor,
    ),
    headline2: GoogleFonts.lato(
      fontSize: 26,
      fontWeight: FontWeight.bold,
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
    headline5: GoogleFonts.lato(
      fontSize: 16,
      color: const Color.fromARGB(255, 184, 184, 184),
    ),
    headline6: GoogleFonts.lato(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: blueColor,
    ),
    bodyText1: GoogleFonts.lato(fontSize: 16, color: blueColor),
    subtitle1: GoogleFonts.lato(),
  ),
);
