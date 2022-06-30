import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbti_app/models/category.dart';
import 'package:kbti_app/providers/definition_provider.dart';
import 'package:kbti_app/providers/category_provider.dart';
import 'package:kbti_app/screens/themes.dart';
import 'package:kbti_app/widgets/definition_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedValue = '1';
  bool showByCategory = false;

  @override
  Widget build(BuildContext context) {
    var definitionProvider = Provider.of<DefinitionProvider>(context);
    definitionProvider.getDefinitions();
    definitionProvider.getDefinitionsByCategories(selectedValue);

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
              buildSearchBar(),
              buildDropdown(),
              const SizedBox(height: 10),
              // buildRandomDefinitions(definitionProvider),
              showByCategory == false
                  ? buildRandomDefinitions(definitionProvider)
                  : buildDefintionsByCategory(definitionProvider),
            ],
          ),
        ));
  }

  FutureBuilder<Object?> buildDefintionsByCategory(
      DefinitionProvider definitionProvider) {
    return FutureBuilder(
        future: definitionProvider.getDefinitionsByCategories(selectedValue),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List data = snapshot.data as List;
            print(data);
            return Expanded(
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      print(data[index]);
                      return DefinitionCard(definition: data[index]);
                    }));
          } else if (snapshot.hasError) {
            return Text('ERROR');
          }
          return CircularProgressIndicator();
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
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return DefinitionCard(definition: data[index]);
                  }),
            );
          }
          return const CircularProgressIndicator();
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
    return Row(
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
              return DropdownButton<String>(
                  alignment: Alignment.centerRight,
                  elevation: 2,
                  borderRadius: BorderRadius.circular(30),
                  dropdownColor: Colors.white,
                  value: selectedValue,
                  items: (snapshot.data)
                      .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                          value: e.id.toString(),
                          child: Text(e.category.toString())))
                      .toList(),
                  onChanged: (changedValue) {
                    setState(() {
                      showByCategory = true;
                      selectedValue = changedValue.toString();
                    });
                  });
            } else {
              return Text('Memuat Kategori....');
            }
          },
        ),
      ],
    );
  }
}
