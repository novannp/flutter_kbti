import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbti_app/screens/themes.dart';
import 'package:kbti_app/widgets/button.dart';
import 'package:kbti_app/widgets/form_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              title: 'Email',
              hint: 'Email Anda',
            ),
            const SizedBox(
              height: 20,
            ),
            FormInput(
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
            child: ButtonMe(
              title: 'Masuk',
              function: () => Navigator.pushNamedAndRemoveUntil(
                context,
                '/home',
                (route) => false,
              ),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Belum Punya Akun?',
            ),
            TextButton(
              onPressed: () {},
              child:
                  Text("Daftar", style: Theme.of(context).textTheme.headline5),
            ),
          ],
        )
      ]),
    ));
  }
}
