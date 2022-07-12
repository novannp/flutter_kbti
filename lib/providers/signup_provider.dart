import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../configs/apiEndPoints.dart';

class SignupProvider extends ChangeNotifier {
  signUp(context, username, email, password) async {
    Uri url = Uri.parse(apiEndPoint['REGISTER']);

    Map data = {"username": username, "email": email, "password": password};
    var response = await http.post(url,
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json; charset=UTF-8'});
    var result = jsonDecode(response.body);
    print(result);

    if (response.statusCode == 201) {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                actions: [LinearProgressIndicator()],
              ));
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Berhasil Daftar Silahkan Masuk",
                textAlign: TextAlign.center)));
      });
    } else if (response.statusCode == 422) {
      Future.delayed(const Duration(seconds: 2), () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Email ini Sudah Terdaftar",
                textAlign: TextAlign.center)));
      });
      print(response.body);
    }
  }
}
