import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kbti_app/providers/theme_provider.dart';
import 'package:kbti_app/screens/themes.dart';
import 'package:kbti_app/services/storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var isLogin = false;
  SecureStorage storage = SecureStorage();

  token() async {
    String? token = await storage.read('token');
    if (token != null) {
      isLogin = true;
    }
  }

  @override
  void initState() {
    token();
    Timer(const Duration(seconds: 2), () {
      !isLogin
          ? Navigator.pushNamedAndRemoveUntil(
              context, '/login', (route) => false)
          : Navigator.pushNamedAndRemoveUntil(
              context, '/home', (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: theme.currentTheme == 'light' ? blueColor : null,
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
