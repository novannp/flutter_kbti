import 'package:flutter/material.dart';
import 'package:kbti_app/providers/definition_provider.dart';
import 'package:kbti_app/providers/dropdown_provider.dart';
import 'package:kbti_app/screens/login_screen.dart';
import 'package:kbti_app/screens/sign_up_screen.dart';
import 'package:kbti_app/screens/splash_screen.dart';
import 'package:kbti_app/screens/themes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'providers/theme_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => DefinitionProvider()),
    ChangeNotifierProvider(create: (_) => DropdownProvider()),
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ], child: const KBTIApp()));
}

class KBTIApp extends StatefulWidget {
  const KBTIApp({Key? key}) : super(key: key);

  @override
  State<KBTIApp> createState() => _KBTIAppState();
}

class _KBTIAppState extends State<KBTIApp> {
  final ThemeProvider themeProvider = ThemeProvider();

  @override
  Widget build(BuildContext context) {
    var isLogin = false;

    @override
    void initState() {
      super.initState();
      Token() async {
        var prefs = await SharedPreferences.getInstance();
        var token = prefs.getString('token');
        if (token != '') {
          isLogin = true;
        }
      }
    }

    return Consumer(
      builder: (context, value, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          darkTheme: darkTheme,
          theme: lightTheme,
          themeMode: themeProvider.themeMode,
          debugShowCheckedModeBanner: false,
          title: 'KBTI',
          initialRoute: isLogin != true ? '/' : '/home',
          routes: {
            '/': (context) => const SplashScreen(),
            '/home': (context) => const HomeScreen(),
            '/signup': (context) => const SignupScreen(),
            '/login': (context) => const LoginScreen()
          },
        );
      },
    );
  }
}
