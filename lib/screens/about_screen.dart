import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbti_app/widgets/avatar_developer.dart';
import 'package:kbti_app/widgets/navigation_drawer.dart';
import 'package:kbti_app/widgets/scroll_behaviour.dart';

import '../widgets/custom_app_bar.dart';
import 'themes.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Tentang'),
      drawer: const NavigationDrawer(),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Text('Tentang Aplikasi',
                          style: Theme.of(context).textTheme.headline2),
                      const Divider(),
                      const SizedBox(height: 10),
                      Image.asset(
                        'assets/images/logo.png',
                        height: 50,
                      ),
                      const Text(
                        '2022 \u00a9 KBTI',
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'KBTI atau Kamus Besar Teknologi Informasi adalah website yang menyediakan istilah dan definisi dalam dunia Informasi Teknologi yang ditulis berdasarkan partisipasi pengguna',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.lato(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Text('Tim Pengembang',
                          style: Theme.of(context).textTheme.headline2),
                      const Divider(),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: const [
                          AvatarDeveloper(
                              name: 'Zahra Aulia Rahmadianti',
                              networkImage: 'https://picsum.photos/200',
                              collage: 'Universitas Brawijaya'),
                          AvatarDeveloper(
                              name: 'Mochamad Rizky Cahya Diputra',
                              networkImage: 'https://picsum.photos/300',
                              collage: 'Institut Teknologi Garut'),
                          AvatarDeveloper(
                              name: 'Tryo Asnafi',
                              networkImage: 'https://picsum.photos/400',
                              collage: 'Politeknik Negeri Bengkalis'),
                          AvatarDeveloper(
                              name: 'Sofyan Egi Lesmana',
                              networkImage: 'https://picsum.photos/500',
                              collage: 'Universitas  Pasundan'),
                          AvatarDeveloper(
                              name: 'Novan Noviansyah Pratama',
                              networkImage: 'https://picsum.photos/600',
                              collage: 'Institut Teknologi Garut'),
                        ],
                      ),
                      const SizedBox(height: 14)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
