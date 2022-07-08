import 'package:flutter/material.dart';
import 'package:kbti_app/widgets/custom_button.dart';
import 'package:kbti_app/widgets/custom_app_bar.dart';
import 'package:kbti_app/widgets/navigation_drawer.dart';

import 'themes.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: buildAppBar('Dashboard'),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 14,
          right: 14,
          top: 10,
        ),
        child: ListView(
          children: [
            buildDashboardCard(context),
            CustomButton(
              onPressed: () {},
              title: '+ Tambahkan istilah baru',
            ),
          ],
        ),
      ),
    );
  }

  Card buildDashboardCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Halo, user1',
                  style: Theme.of(context).textTheme.headline1,
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Info'),
                              titleTextStyle:
                                  Theme.of(context).textTheme.headline3,
                              content: const Text(
                                  'Setiap definisi dari istilah yang kamu buat akan direview oleh admin, setelah itu jika diterima maka istilahmu akan ditampilkan untuk publik'),
                            );
                          });
                    },
                    icon: const Icon(Icons.info_rounded))
              ],
            ),
            Text(
              'Status definisi yang kamu buat',
              style: Theme.of(context).textTheme.headline5,
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: bgChipColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          '0',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(
                          'disetujui',
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '0',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(
                          'direview',
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '0',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(
                          'ditolak',
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
