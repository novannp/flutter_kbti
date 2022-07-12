import 'dart:convert';
import 'package:flutter/material.dart';
import '../configs/config.dart';
import '../models/category.dart';
import 'package:http/http.dart' as http;

class DropdownProvider extends ChangeNotifier {
  getCategory() async {
    // var url = Uri.parse('$baseUrl/categories');
    var url = Uri.parse('$baseUrl/categories');

    var result = await http.get(url);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body)['data'];
      //MAPPING TO CATEGORY OBJECT
      List<Category> categories =
          data.map((e) => Category.fromJson(e)).toList();

      return categories;
    } else {
      <Category>[];
    }
  }
}
