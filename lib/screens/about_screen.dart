import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbti_app/widgets/navigation_drawer.dart';

import 'themes.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: blueColor,
          elevation: 2,
          title: Text(
            'Tentang',
            style: GoogleFonts.lato(fontSize: 20),
          )),
      drawer: const NavigationDrawer(),
    );
  }
}
