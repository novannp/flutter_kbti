import 'package:flutter/material.dart';
import 'package:kbti_app/providers/dropdown_provider.dart';
import 'package:kbti_app/providers/user_provider.dart';
import 'package:kbti_app/widgets/custom_button.dart';
import 'package:kbti_app/widgets/custom_app_bar.dart';
import 'package:kbti_app/widgets/definition_card.dart';
import 'package:kbti_app/widgets/form_input.dart';
import 'package:kbti_app/widgets/navigation_drawer.dart';
import 'package:kbti_app/extensions/capitalize_first_letter.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String selectedValue = '1';
  final termCtrl = TextEditingController();
  final definitionCtrl = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    termCtrl.dispose();
    definitionCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var dropdownProvider = Provider.of<DropdownProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: buildAppBarWithActions('Dashboard', [
        IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/dashboard');
            },
            icon: const Icon(Icons.refresh))
      ]),
      body: FutureBuilder(
        future: userProvider.getProfileUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> result = snapshot.data as Map<String, dynamic>;
            var user = User.fromJson(result);
            return Padding(
              padding: const EdgeInsets.only(left: 14, right: 14, top: 10),
              child: ListView(
                children: [
                  buildDashboardCard(context, user),
                  CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) {
                            return Scaffold(
                                appBar: buildAppBar('Tambahkan Definisi'),
                                body: ListView(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 30),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Form(
                                                key: _formKey,
                                                child: Column(
                                                  children: [
                                                    FormInput(
                                                        controller: termCtrl,
                                                        title: 'Judul',
                                                        hint: 'Masukkan Judul',
                                                        validator:
                                                            (String? value) {
                                                          if (value!.isEmpty) {
                                                            return "Please add title";
                                                          }
                                                          return null;
                                                        }),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    FormInput(
                                                        controller:
                                                            definitionCtrl,
                                                        maxLines: 6,
                                                        title: 'Deskripsi',
                                                        hint:
                                                            "Masukkan Deskripsi",
                                                        validator:
                                                            (String? value) {
                                                          if (value!.isEmpty) {
                                                            return "Please add Description";
                                                          }
                                                          return null;
                                                        }),
                                                  ],
                                                )),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20),
                                              child: buildDropdownFormField(
                                                  dropdownProvider),
                                            ),
                                            CustomButton(
                                                title: 'Kirim',
                                                onPressed: () {
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    userProvider.addDefinition(
                                                        context,
                                                        termCtrl.text,
                                                        definitionCtrl.text,
                                                        selectedValue);
                                                  }
                                                }),
                                          ]),
                                    ),
                                  ],
                                ));
                          },
                        ),
                      );
                    },
                    title: '+ Tambahkan istilah baru',
                  ),
                  const SizedBox(height: 10),
                  Column(
                      children: user.definitions!
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

  FutureBuilder<dynamic> buildDropdownFormField(
      DropdownProvider dropdownProvider) {
    return FutureBuilder(
        future: dropdownProvider.getCategory(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<DropdownMenuItem<String>> items = snapshot.data
                ?.map<DropdownMenuItem<String>>(
                  (item) => DropdownMenuItem(
                    value: item.id.toString(),
                    child: Text(
                      item.category.toString(),
                    ),
                  ),
                )
                .toList();
            return DropdownButtonFormField<String>(
                value: selectedValue,
                items: items,
                onChanged: (newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                });
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: const Center(
                child: Text('Loading kategori'),
              ),
            );
          } else {
            return const Text('Gagal Mendapatkan kategori yang tersedia');
          }
        });
  }

  Widget buildDashboardCard(BuildContext context, User user) {
    // ThemeProvider theme = ThemeProvider();
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Halo, ${user.username.toString().capitalize()} ',
                    style: Theme.of(context).textTheme.headline1,
                  ),
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
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: Text(
                'Status definisi yang kamu buat',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
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
