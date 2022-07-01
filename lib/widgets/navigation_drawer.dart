import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbti_app/screens/dashboard_screen.dart';
import 'package:kbti_app/screens/themes.dart';
import 'package:kbti_app/widgets/drawer_list_tile.dart';

import '../screens/about_screen.dart';
import '../screens/home_screen.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: blueColor,
      height: double.infinity,
      width: (MediaQuery.of(context).size.width) * 0.65,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: blueDarkColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 60,
                      width: 60,
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage('https://picsum.photos/200'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Novan Noviansyah Pratama',
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'novangarut@gmail.com',
                      style: GoogleFonts.lato(color: Colors.grey[400]),
                    )
                  ],
                ),
              ),
              DrawerListTile(
                title: 'Dashboard',
                icon: const Icon(Icons.dashboard_rounded, color: Colors.white),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const DashboardScreen();
                  }));
                },
              ),
              DrawerListTile(
                title: 'Pencarian',
                icon: const Icon(Icons.search_rounded, color: Colors.white),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomeScreen();
                  }));
                },
              ),
              DrawerListTile(
                title: 'Tentang',
                icon:
                    const Icon(Icons.info_outline_rounded, color: Colors.white),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AboutScreen();
                  }));
                },
              ),
              DrawerListTile(
                title: 'Logout',
                icon: const Icon(Icons.logout_rounded, color: Colors.white),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const DashboardScreen();
                  }));
                },
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  '2022 \u00a9 KBTI',
                  style: GoogleFonts.lato(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
