import 'package:edutrack_app/pages/login_page.dart';
import 'package:edutrack_app/pages/onboarding1_page.dart';
import 'package:edutrack_app/pages/onboarding2_page.dart';
import 'package:edutrack_app/pages/register_page.dart';
import 'package:edutrack_app/pages/splash_page.dart';
import 'package:edutrack_app/pages/main_navigation.dart';
import 'package:edutrack_app/pages/profile_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),
        '/onboarding1': (context) => Onboarding1Page(),
        '/onboarding2': (context) => Onboarding2Page(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => MainNavigation(),
        '/profile': (context) => ProfilePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
