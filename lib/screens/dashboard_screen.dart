import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbti_app/widgets/navigation_drawer.dart';

import 'themes.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: blueColor,
        elevation: 2,
        title: Text(
          'Dashboard',
          style: GoogleFonts.lato(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
