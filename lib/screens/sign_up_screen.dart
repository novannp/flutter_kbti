import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kbti_app/screens/login_screen.dart';
import 'package:kbti_app/widgets/custom_button.dart';
import 'package:kbti_app/widgets/form_input.dart';
import 'package:http/http.dart' as http;
import '../configs/apiEndPoints.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usernamCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final passCtrl = TextEditingController();

    return Scaffold(
        body: ListView(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 1.2,
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
              "Daftar",
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormInput(
                  controller: usernamCtrl,
                  title: 'Username',
                  hint: 'Username Anda',
                ),
                const SizedBox(
                  height: 20,
                ),
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
                  title: 'Daftar',
                  onPressed: () {
                    SignUp(context, usernamCtrl.text, emailCtrl.text,
                        passCtrl.text);
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sudah Punya Akun ? ',
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                        (route) => false);
                  },
                  child: Text(
                    ' Masuk',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ],
            )
          ]),
        ),
      ],
    ));
  }

  Future SignUp(context, username, email, password) async {
    Uri url = Uri.parse(apiEndPoint['REGISTER']);

    Map data = {
      "username": username,
      "email": email,
      "password": password,
    };
    var response = await http.post(url, body: jsonEncode(data), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 201) {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text('Berhasil Daftar'),
                actions: [
                  LinearProgressIndicator(),
                ],
              ));
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      });
    } else {
      print(response.body);
      print('gagal daftar');
    }
  }
}
