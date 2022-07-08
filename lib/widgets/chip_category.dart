import 'package:flutter/material.dart';
import 'package:kbti_app/screens/themes.dart';

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
      label: Text(widget.label),
    );
  }
}
