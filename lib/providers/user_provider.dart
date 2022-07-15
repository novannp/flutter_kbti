import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kbti_app/configs/apiEndPoints.dart';
import 'package:http/http.dart' as http;
import 'package:kbti_app/services/storage.dart';

import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  var storage = SecureStorage();

  Future<Map<String, dynamic>?> getProfileUser() async {
    var token = await storage.read('token');
    Uri url = Uri.parse(apiEndPoint['DASHBOARD']);

    var response =
        await http.get(url, headers: {"Authorization": "Bearer $token"});
    var result = jsonDecode(response.body)['data'];
    if (response.statusCode == 200) {
      return result as Map<String, dynamic>;
    } else {
      return null;
    }
  }

  signUp(context, username, email, password) async {
    Uri url = Uri.parse(apiEndPoint['REGISTER']);

    Map data = {"username": username, "email": email, "password": password};
    var response = await http.post(url,
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json; charset=UTF-8'});

    if (response.statusCode == 201) {
      loading();
      Future.delayed(const Duration(seconds: 2), () {
        ScaffoldMessenger.of(context).showSnackBar(snackbar("Berhasil Daftar"));
      });
    } else if (response.statusCode == 422) {
      Future.delayed(const Duration(seconds: 2), () {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackbar('Email ini Sudah Terdaftar'));
      });
    }
    login(context, email, password);
  }

  Future login(context, String email, String password) async {
    Uri url = Uri.parse(apiEndPoint['LOGIN']);
    Map data = {"email": email, "password": password};

    var response = await http.post(
      url,
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    var result = jsonDecode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var token = result['data']['access_token']['token'];
      var tokenStorage = storage.write('token', token);

      showDialog(context: context, builder: (context) => loading());
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      });
      return token;
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
    }
  }

  logout(context) async {
    await storage.delete('token');
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  SnackBar snackbar(String msg) {
    return SnackBar(content: Text(msg, textAlign: TextAlign.center));
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
