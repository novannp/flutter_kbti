// import 'package:http/http.dart' as http;
// import 'dart:convert';

class Category {
  int id;
  String category;

  Category({required this.id, required this.category});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      category: json["category"],
    );
  }
}
