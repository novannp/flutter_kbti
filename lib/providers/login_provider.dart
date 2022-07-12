import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../configs/apiEndPoints.dart';

class LoginProvider extends ChangeNotifier {
  login(context, String email, String password) async {
    Uri url = Uri.parse(apiEndPoint['LOGIN']);
    Map data = {"email": email, "password": password};

    var response = await http.post(url, body: jsonEncode(data), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    });
    var result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      var prefs = await SharedPreferences.getInstance();
      var token = result['data']['access_token']['token'];
      // Set SharedPreference in Local
      prefs.setString('token', token);
      print(token);

      showDialog(context: context, builder: (context) => loading());
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      });
    } else {
      showDialog(context: context, builder: (context) => loading());
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: Duration(seconds: 2),
            content: Text(
              'Email dan Password salah',
              textAlign: TextAlign.center,
            )));
      });
      print(response.body);
    }
  }

  Container loading() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 100,
      ),
      child: const Center(
        child: LinearProgressIndicator(),
      ),
    );
  }
}
