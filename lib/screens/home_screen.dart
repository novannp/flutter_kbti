import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbti_app/providers/definition_provider.dart';
import 'package:kbti_app/providers/category_provider.dart';
import 'package:kbti_app/screens/themes.dart';
import 'package:kbti_app/widgets/definition_card.dart';
import 'package:kbti_app/widgets/scroll_behaviour.dart';
import 'package:provider/provider.dart';

import '../models/definition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedIdValue = '1';
  String selectedCategory = '';
  bool showByCategory = false;

  @override
  Widget build(BuildContext context) {
    var definitionProvider = Provider.of<DefinitionProvider>(context);
    definitionProvider.getDefinitions();
    definitionProvider.getDefinitionsByCategories(selectedIdValue);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: blueColor,
          elevation: 0,
          title: Image.asset(
            'assets/images/logo.png',
            height: 30,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          child: Column(
            children: [
              buildDropdown(),
              const SizedBox(height: 10),
              buildSearchBar(),
              const SizedBox(height: 10),
              // buildRandomDefinitions(definitionProvider),
              if (showByCategory == false)
                buildRandomDefinitions(definitionProvider)
              else
                buildDefintionsByCategory(definitionProvider),
            ],
          ),
        ));
  }

  FutureBuilder<Object?> buildDefintionsByCategory(
      DefinitionProvider definitionProvider) {
    return FutureBuilder(
        future: definitionProvider.getDefinitionsByCategories(selectedIdValue),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Definition> data = snapshot.data as List<Definition>;
            int index = 0;
            return Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Kategory dari "${data[index].category}"',
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
                        }),
                  ),
                ),
              ],
            ));
          } else if (snapshot.hasError) {
            return Expanded(
              child: Column(
                children: [
                  CircularProgressIndicator(
                    color: blueColor,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Memuat..',
                    style: GoogleFonts.lato(fontSize: 18),
                  ),
                ],
              ),
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

  Widget buildSearchBar() {
    return TextFormField(
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
    );
  }

  Widget buildDropdown() {
    var dropdownProvider = Provider.of<CategoryProvider>(context);

    dropdownProvider.getCategory();
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
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
