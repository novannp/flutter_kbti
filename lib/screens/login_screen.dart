import 'package:flutter/material.dart';
import 'package:kbti_app/screens/sign_up_screen.dart';
import 'package:kbti_app/widgets/custom_button.dart';
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
            child: CustomButton(
              title: 'Masuk',
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context,
                '/home',
                (route) => false,
              ),
            )),
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
}
