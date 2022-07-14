import 'package:flutter/material.dart';
import 'package:kbti_app/providers/user_provider.dart';
import 'package:kbti_app/widgets/custom_button.dart';
import 'package:kbti_app/widgets/custom_app_bar.dart';
import 'package:kbti_app/widgets/definition_card.dart';
import 'package:kbti_app/widgets/navigation_drawer.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import 'themes.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: buildAppBar('Dashboard'),
      body: FutureBuilder(
        future: userProvider.getProfileUser(),
        builder: (context, snapshot) {
          Map<String, dynamic> result = snapshot.data as Map<String, dynamic>;

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            var user = User.fromJson(result);
            return Padding(
              padding: const EdgeInsets.only(left: 14, right: 14, top: 10),
              child: ListView(
                children: [
                  buildDashboardCard(context, user),
                  CustomButton(
                    onPressed: () {},
                    title: '+ Tambahkan istilah baru',
                  ),
                  const SizedBox(height: 10),
                  Column(
                      children: user.definitions
                          .map((definition) =>
                              DefinitionCard(definition: definition))
                          .toList()),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }

  Widget buildDashboardCard(BuildContext context, User user) {
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
                  'Halo, ${user.username}',
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
                          user.totalApproved.toString(),
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
                          user.totalReview.toString(),
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
                          user.totalReject.toString(),
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
