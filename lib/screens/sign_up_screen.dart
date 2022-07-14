import 'package:flutter/material.dart';
import 'package:kbti_app/providers/user_provider.dart';
import 'package:kbti_app/widgets/custom_button.dart';
import 'package:kbti_app/widgets/form_input.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final usernamCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var signupProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        body: ListView(children: [
      Container(
          height: MediaQuery.of(context).size.height / 1.2,
          margin: const EdgeInsets.symmetric(horizontal: 70),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/images/logo.png', height: 50),
            const SizedBox(height: 10),
            Text("Daftar", style: Theme.of(context).textTheme.headline2),
            const SizedBox(height: 50),
            Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormInput(
                          controller: usernamCtrl,
                          title: 'Username',
                          hint: 'Username Anda',
                          validator: (String? username) {
                            if (username!.isEmpty) {
                              return 'Isi Username Anda';
                            } else if (username.length < 3) {
                              return 'Panjang Username Minimal 3 Karakter';
                            }
                            return null;
                          }),
                      const SizedBox(height: 20),
                      FormInput(
                          controller: emailCtrl,
                          title: 'Email',
                          hint: 'Email Anda',
                          validator: (email) {
                            if (email!.isEmpty) {
                              return 'Isi Email Anda';
                            } else if (!emailRegex.hasMatch(email)) {
                              return 'Isi Email dengan Benar';
                            }
                            return null;
                          }),
                      const SizedBox(height: 20),
                      FormInput(
                          controller: passCtrl,
                          title: 'Password',
                          hint: 'Password Anda',
                          obscureText: true,
                          validator: (pass) {
                            if (pass!.isEmpty) {
                              return 'Isi Password Anda';
                            } else if (pass.length < 8) {
                              return 'Panjang Password min.8 Karakter';
                            }
                            return null;
                          })
                    ])),
            const SizedBox(height: 20),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                width: double.infinity,
                child: CustomButton(
                    title: 'Daftar',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        signupProvider.signUp(context, usernamCtrl.text,
                            emailCtrl.text, passCtrl.text);
                      }
                    })),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('Sudah Punya Akun ? '),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (route) => false);
                  },
                  child: Text(' Masuk',
                      style: Theme.of(context).textTheme.headline5))
            ])
          ]))
    ]));
  }
}
