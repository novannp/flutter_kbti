import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:kbti_app/configs/apiEndPoints.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  Future getProfileUser() async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    Uri url = Uri.parse(apiEndPoint['DASHBOARD']);

    var response =
        await http.get(url, headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    }
  }
}
