import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbti_app/screens/themes.dart';

class ChipCategory extends StatelessWidget {
  final String label;
  const ChipCategory({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
        backgroundColor: bgChipColor,
        label: Text(
          label,
          style: GoogleFonts.lato(
              fontSize: 12, color: blueColor, fontWeight: FontWeight.bold),
        ));
  }
}
