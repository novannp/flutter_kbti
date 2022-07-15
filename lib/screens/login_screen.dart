import 'package:flutter/material.dart';
import 'package:kbti_app/providers/user_provider.dart';
import 'package:kbti_app/screens/sign_up_screen.dart';
import 'package:kbti_app/widgets/custom_button.dart';
import 'package:kbti_app/widgets/form_input.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailCtrl = TextEditingController();

  final TextEditingController passCtrl = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailCtrl.dispose();
    passCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loginProvider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height: 50),
            const SizedBox(height: 10),
            Text("Masuk", style: Theme.of(context).textTheme.headline2),
            const SizedBox(height: 50),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Form(
                  key: _formKey,
                  child: Column(children: [
                    FormInput(
                        controller: emailCtrl,
                        title: 'Email',
                        hint: 'Email Anda',
                        validator: (String? email) {
                          if (email!.isEmpty) {
                            return "Isi Email";
                          }
                          return null;
                        }),
                    const SizedBox(height: 20),
                    FormInput(
                        controller: passCtrl,
                        obscureText: true,
                        title: 'Password',
                        hint: 'Password Anda',
                        validator: (String? pass) {
                          if (pass!.isEmpty) {
                            return "Isi Password";
                          }
                          return null;
                        })
                  ]))
            ]),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                title: 'Masuk',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    loginProvider.login(context, emailCtrl.text, passCtrl.text);
                  }
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Belum Punya Akun ? '),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
                          (route) => false);
                    },
                    child: Text(' Daftar',
                        style: Theme.of(context).textTheme.headline5))
              ],
            )
          ],
        ),
      ),
    );
  }
}
