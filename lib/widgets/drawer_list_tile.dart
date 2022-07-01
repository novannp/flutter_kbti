import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/themes.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function() onTap;
  final bool selected = false;
  const DrawerListTile(
      {Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        splashColor: blueDarkColor,
        onTap: onTap,
        child: ListTile(
          leading: icon,
          title: Text(
            title,
            style: GoogleFonts.lato(fontSize: 16, color: blueColor),
          ),
        ),
      ),
    );
  }
}
