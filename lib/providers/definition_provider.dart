import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kbti_app/models/definition.dart';

import '../configs/config.dart';
import '../models/term.dart';

class DefinitionProvider extends ChangeNotifier {
  getDefinitions() async {
    var url = Uri.parse('$baseUrl/terms/random');

    var result = await http.get(url);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body)['data'];
      List<Definition> definitions =
          data.map((item) => Definition.fromJson(item)).toList();

      return definitions;
    } else if (result.statusCode == 404) {
      return Center(
        child: Image.asset('assets/images/empty-list.png'),
      );
    } else {
      return <Definition>[];
    }
  }

  getDefinitionsByCategories(id) async {
    var url =
        Uri.parse('https://kbti-api.herokuapp.com/definitions?categoryId=$id');
    var result = await http.get(url);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body)['data'];
      List<Definition> definitions =
          data.map((e) => Definition.fromJson(e)).toList();
      return definitions;
    } else if (result.statusCode == 404) {
      throw 'error';
    } else {
      return <Definition>[];
    }
  }

  getDefinitionsByTerm(List terms) async {
    int i = 0;
    List<Definition> definitions = [];

    while (i < terms.length) {
      var url = Uri.parse(
          'https://kbti-api.herokuapp.com/definitions?term=${terms[i].term}');
      var result = await http.get(url);

      if (result.statusCode == 200) {
        var term = jsonDecode(result.body)['data'];
        var getData = term[0];
        var definition = Definition.fromJson(getData);
        definitions.add(definition);
      } else if (result.statusCode == 404) {
        throw 'error';
      }

      i++;
    }
    return definitions;
  }

  searchDefinitions(userInput) async {
    var url = Uri.parse('https://kbti-api.herokuapp.com/search?q=$userInput');
    var result = await http.get(url);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body)['data'];
      List<Term> term = data.map((e) => Term.fromJson(e)).toList();
      return getDefinitionsByTerm(term);
    } else if (result.statusCode == 404) {
      return <Term>[];
    } else {
      return <Term>[];
    }
  }
}
