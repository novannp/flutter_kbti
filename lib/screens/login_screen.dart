import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kbti_app/screens/sign_up_screen.dart';
import 'package:kbti_app/widgets/custom_button.dart';
import 'package:kbti_app/widgets/form_input.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../configs/apiEndPoints.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailCtrl = TextEditingController();
    final passCtrl = TextEditingController();

    return Scaffold(
        body: Container(
      margin: const EdgeInsets.symmetric(horizontal: 70),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          'assets/images/logo.png',
          height: 50,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Masuk",
          style: Theme.of(context).textTheme.headline2,
        ),
        const SizedBox(
          height: 50,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormInput(
              controller: emailCtrl,
              title: 'Email',
              hint: 'Email Anda',
            ),
            const SizedBox(
              height: 20,
            ),
            FormInput(
              controller: passCtrl,
              title: 'Password',
              hint: 'Password Anda',
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            width: double.infinity,
            child: CustomButton(
                title: 'Masuk',
                onPressed: () => Login(
                      context,
                      emailCtrl.text,
                      passCtrl.text,
                    ))),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Belum Punya Akun ? ',
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const SignupScreen(),
                    ),
                    (route) => false);
              },
              child: Text(
                ' Daftar',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        )
      ]),
    ));
  }

  Future Login(context, email, password) async {
    Uri url = Uri.parse(apiEndPoint['LOGIN']);

    Map data = {
      "email": email,
      "password": password,
    };
    var response = await http.post(url, body: jsonEncode(data), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200) {
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.setString('token',
          (jsonDecode(response.body)['data']['access_token']['token']));
      print(jsonDecode(response.body)['data']['access_token']['token']);
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text('Berhasil Login'),
                actions: [
                  LinearProgressIndicator(),
                ],
              ));
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      });
    } else {
      print(response.body);
      print('gagal masuk');
    }
  }
}
