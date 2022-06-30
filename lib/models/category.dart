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

//   static Future<List<dynamic>> fetchCategory() async {
//     var apiUrl = Uri.parse('https://kbti-api.herokuapp.com/categories');
//     final response = await http.get(apiUrl);

//     if (response.statusCode == 200) {
//       var jsonObject = json.decode(response.body);

//       var jsonResult = jsonObject['data'];

//       var result = {for (var category in jsonResult) category[0]: category[1]};

//       return jsonResult;
//     } else {
//       throw Exception('Failed to Load');
//     }
//   }
}
