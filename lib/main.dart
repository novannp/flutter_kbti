import 'package:flutter/material.dart';
import 'package:kbti_app/providers/definition_provider.dart';
import 'package:kbti_app/providers/dropdown_provider.dart';
import 'package:kbti_app/providers/user_provider.dart';
import 'package:kbti_app/screens/login_screen.dart';
import 'package:kbti_app/screens/sign_up_screen.dart';
import 'package:kbti_app/screens/splash_screen.dart';
import 'package:kbti_app/screens/themes.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'screens/dashboard_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => DefinitionProvider()),
    ChangeNotifierProvider(create: (_) => DropdownProvider()),
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => UserProvider()),
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
    return Consumer(
      builder: (context, value, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          darkTheme: darkTheme,
          theme: lightTheme,
          themeMode: themeProvider.themeMode,
          debugShowCheckedModeBanner: false,
          title: 'KBTI',
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            '/home': (context) => const HomeScreen(),
            '/dashboard': (context) => DashboardScreen(),
            '/signup': (context) => SignupScreen(),
            '/login': (context) => LoginScreen()
          },
        );
      },
    );
  }
}
