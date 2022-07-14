import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbti_app/providers/user_provider.dart';
import 'package:kbti_app/screens/dashboard_screen.dart';
import 'package:kbti_app/screens/login_screen.dart';
import 'package:kbti_app/screens/settings_screen.dart';
import 'package:kbti_app/screens/themes.dart';
import 'package:kbti_app/widgets/drawer_list_tile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/about_screen.dart';
import '../screens/home_screen.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

    return Container(
      color: Theme.of(context).canvasColor,
      height: double.infinity,
      width: (MediaQuery.of(context).size.width) * 0.65,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FutureBuilder(
                future: userProvider.getProfileUser(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return DrawerHeader(
                      decoration: BoxDecoration(
                        color: blueDarkColor,
                      ),
                      child: Container(),
                    );
                  } else {
                    return DrawerHeader(
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
                            snapshot.data['username'] ?? 'Unknown',
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            snapshot.data['email'] ?? 'Unknown',
                            style: GoogleFonts.lato(color: Colors.grey[400]),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    );
                  }
                },
              ),
              DrawerListTile(
                title: 'Dashboard',
                icon: const Icon(Icons.dashboard_rounded),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DashboardScreen();
                  }));
                },
              ),
              DrawerListTile(
                title: 'Pencarian',
                icon: const Icon(Icons.search_rounded),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomeScreen();
                  }));
                },
              ),
              DrawerListTile(
                title: 'Tentang',
                icon: const Icon(Icons.info_outline_rounded),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AboutScreen();
                  }));
                },
              ),
              DrawerListTile(
                  title: 'Pengaturan',
                  icon: const Icon(Icons.settings_rounded),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsScreen()),
                        ((route) => true));
                  }),
              DrawerListTile(
                title: 'Logout',
                icon: const Icon(Icons.logout_rounded),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => popupLogout(userProvider));
                },
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  '2022 \u00a9 KBTI',
                  style: GoogleFonts.lato(color: blueColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget popupLogout(UserProvider userProvider) {
    return AlertDialog(
      title: Text(
        'Anda yakin ingin Logout ?',
        style: Theme.of(context).textTheme.headline5,
      ),
      actions: [
        TextButton(
          onPressed: () {
            userProvider.logout(context);
          },
          child: Text(
            'Ya',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Tidak',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
      ],
    );
  }
}
