import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kbti_app/configs/apiEndPoints.dart';
import 'package:kbti_app/models/definition.dart';
import '../configs/config.dart';
import '../models/term.dart';

class DefinitionProvider extends ChangeNotifier {
  getRandomDefinitions() async {
    var url = Uri.parse(apiEndPoint['GET_RANDOM_DEFINITIONS']);

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
    var url = Uri.parse(apiEndPoint['GET_DEFINITIONS_BY_CATEGORY'] + id);
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
      var url =
          Uri.parse('${apiEndPoint['GET_DEFINITION_BY_TERM']}${terms[i].term}');
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
    var url = Uri.parse('${apiEndPoint['SEARCH_DEFINITION']}$userInput');
    var result = await http.get(url);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body)['data'];
      List<Term> terms = data.map((e) => Term.fromJson(e)).toList();
      return getDefinitionsByTerm(terms);
    } else if (result.statusCode == 404) {
      throw 'error';
    } else {
      return <Term>[];
    }
  }
}
