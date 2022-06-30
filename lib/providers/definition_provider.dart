import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kbti_app/models/definition.dart';

import '../configs/config.dart';

class DefinitionProvider extends ChangeNotifier {
  getDefinitions() async {
    var url = Uri.parse('$baseUrl/terms/random');

    var result = await http.get(url);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body)['data'];
      List<Definition> definitions =
          data.map((item) => Definition.fromJson(item)).toList();

      return definitions;
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
    } else {
      return <Definition>[];
    }
  }
}
