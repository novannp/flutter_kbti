// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbti_app/providers/definition_provider.dart';
import 'package:kbti_app/providers/dropdown_provider.dart';
import 'package:kbti_app/screens/themes.dart';
import 'package:kbti_app/widgets/definition_card.dart';
import 'package:kbti_app/widgets/navigation_drawer.dart';
import 'package:kbti_app/widgets/scroll_behaviour.dart';
import 'package:provider/provider.dart';

import '../models/definition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  String selectedIdValue = '1';
  String selectedCategory = '';
  bool showByCategory = false;
  bool showBySearch = false;
  bool showByRandom = true;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var definitionProvider = Provider.of<DefinitionProvider>(context);
    definitionProvider.getDefinitions();
    definitionProvider.getDefinitionsByCategories(selectedIdValue);

    var dropdownProvider = Provider.of<DropdownProvider>(context);
    dropdownProvider.getCategory();

    return Scaffold(
        drawer: const NavigationDrawer(),
        // floatingActionButtonLocation:
        //     FloatingActionButtonLocation.miniEndDocked,
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: blueColor,
        //   onPressed: () {},
        //   child: Icon(Icons.add_rounded),
        // ),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: blueColor,
          elevation: 2,
          title: Image.asset(
            'assets/images/logo.png',
            height: 30,
          ),
        ),
        // bottomNavigationBar: CustomBottomAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          child: Column(
            children: [
              buildDropdown(dropdownProvider),
              const SizedBox(height: 10),
              buildSearchBar(definitionProvider),
              const SizedBox(height: 10),
              if (showByCategory == true)
                buildDefinitionsByCategory(definitionProvider)
              else if (controller.text == "")
                buildRandomDefinitions(definitionProvider)
              else if (showBySearch == true)
                buildDefinitionsBySearch(definitionProvider)
              else
                buildRandomDefinitions(definitionProvider)
            ],
          ),
        ));
  }

  FutureBuilder<Object?> buildDefinitionsBySearch(
      DefinitionProvider definitionProvider) {
    return FutureBuilder(
        future:
            definitionProvider.searchDefinitions(controller.text.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Expanded(
              child: Center(
                child: CircularProgressIndicator(
                  color: blueColor,
                ),
              ),
            );
          } else if (snapshot.hasData) {
            List data = snapshot.data as List;
            return Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSearchedText(),
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return DefinitionCard(definition: data[index]);
                          }),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Pencarian tidak ditemukan!',
                    style: GoogleFonts.lato(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: blueColor,
                    )),
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/empty-list.png',
                      height: 150,
                    ),
                    const SizedBox(height: 20),
                    Text(
                        'Data definisi tidak ditemukan, silahkan lakukan pencarian!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontSize: 24,
                          color: Colors.grey,
                        )),
                  ],
                ),
              ],
            ));
          }
        });
  }

  FutureBuilder<Object?> buildDefinitionsByCategory(
      DefinitionProvider definitionProvider) {
    return FutureBuilder(
        future: definitionProvider.getDefinitionsByCategories(selectedIdValue),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Expanded(
              child: Center(
                child: CircularProgressIndicator(
                  color: blueColor,
                ),
              ),
            );
          } else if (snapshot.hasData) {
            List<Definition> data = snapshot.data as List<Definition>;
            int index = 0;
            return Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Kategori dari "${data[index].category}" :',
                    style: GoogleFonts.lato(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: blueColor,
                    )),
                const SizedBox(height: 15),
                ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: Expanded(
                      child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return DefinitionCard(definition: data[index]);
                          })),
                ),
              ],
            ));
          } else if (snapshot.hasError) {
            return Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Kategori ini kosong!',
                    style: GoogleFonts.lato(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: blueColor,
                    )),
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/empty-list.png'),
                    const SizedBox(height: 20),
                    Text(
                        'Data definisi tidak ditemukan, silahkan lakukan pencarian!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontSize: 24,
                          color: Colors.grey,
                        )),
                  ],
                ),
              ],
            ));
          } else {
            CircularProgressIndicator(
              color: blueColor,
            );
          }
          return CircularProgressIndicator(
            color: blueColor,
          );
        });
  }

  FutureBuilder<Object?> buildRandomDefinitions(
      DefinitionProvider definitionProvider) {
    return FutureBuilder(
        future: definitionProvider.getDefinitions(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List data = snapshot.data as List;
            return Expanded(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return DefinitionCard(definition: data[index]);
                    }),
              ),
            );
          }
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: blueColor,
                ),
                const SizedBox(height: 20),
                Text(
                  'Memuat...',
                  style: GoogleFonts.lato(fontSize: 18),
                ),
              ],
            ),
          );
        });
  }

  Widget buildSearchedText() {
    return Column(
      children: [
        const SizedBox(height: 10),
        Text(
          'Hasil pencarian "${controller.text}"',
          style: GoogleFonts.lato(fontSize: 20),
        )
      ],
    );
  }

  Widget buildSearchBar(DefinitionProvider definitionProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onFieldSubmitted: (newValue) {
            setState(() {
              showByCategory = false;
              showBySearch = true;
            });
          },
          controller: controller,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          style: const TextStyle(fontSize: 20),
          cursorColor: blueColor,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              hintText: 'Cari Istilah',
              hintStyle: TextStyle(fontSize: 20, color: blueColor),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: greyColor),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: greyColor.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(30))),
        ),
      ],
    );
  }

  Widget buildDropdown(DropdownProvider dropdownProvider) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Kategori',
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          FutureBuilder(
            future: dropdownProvider.getCategory(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                List<DropdownMenuItem<String>> items = (snapshot.data)
                    .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                        value: e.id.toString(),
                        child: Text(e.category.toString())))
                    .toList();
                return DropdownButton<String>(
                    alignment: Alignment.centerRight,
                    elevation: 2,
                    borderRadius: BorderRadius.circular(30),
                    dropdownColor: Colors.white,
                    value: selectedIdValue,
                    items: items,
                    onChanged: (changedValue) {
                      setState(() {
                        showByCategory = true;
                        selectedIdValue = changedValue.toString();
                      });
                    });
              } else {
                return Row(
                  children: [
                    SizedBox(
                      height: 10,
                      width: 10,
                      child: CircularProgressIndicator(
                        color: blueColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Memuat Kategori....',
                      style: GoogleFonts.lato(fontSize: 15),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
