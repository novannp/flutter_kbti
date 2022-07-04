import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbti_app/screens/themes.dart';
import 'package:provider/provider.dart';

class ChipCategory extends StatefulWidget {
  final String label;
  const ChipCategory({Key? key, required this.label}) : super(key: key);

  @override
  State<ChipCategory> createState() => _ChipCategoryState();
}

class _ChipCategoryState extends State<ChipCategory> {
  @override
  Widget build(BuildContext context) {
    return Chip(
        elevation: 0,
        side: BorderSide(color: greyColor, width: 2),
        backgroundColor:
            isDarkMode ? Color.fromARGB(255, 44, 44, 44) : bgChipColor,
        label: Text(
          widget.label,
          style: GoogleFonts.lato(
            fontSize: 12,
            color: isDarkMode ? Colors.white : blueColor,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
