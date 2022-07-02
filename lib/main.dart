import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbti_app/providers/definition_provider.dart';
import 'package:kbti_app/providers/dropdown_provider.dart';
import 'package:kbti_app/screens/splash_screen.dart';
import 'package:kbti_app/screens/themes.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => DefinitionProvider()),
    ChangeNotifierProvider(create: (_) => DropdownProvider()),
  ], child: const KBTIApp()));
}

class KBTIApp extends StatelessWidget {
  const KBTIApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      theme: ThemeData(textTheme: TextTheme(subtitle1: GoogleFonts.lato())),
      debugShowCheckedModeBanner: false,
      title: 'KBTI',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen()
      },
    );
  }
}
