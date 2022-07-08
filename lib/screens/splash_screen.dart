import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kbti_app/screens/login_screen.dart';
import 'package:kbti_app/screens/themes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      // Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const LoginScreen();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Kamus Besar Teknologi Informasi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ))
            ]),
      ),
    );
  }
}
