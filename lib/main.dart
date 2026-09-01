import 'package:edutrack_app/pages/login_page.dart';
import 'package:edutrack_app/pages/onboarding1_page.dart';
import 'package:edutrack_app/pages/onboarding2_page.dart';
import 'package:edutrack_app/pages/register_page.dart';
import 'package:edutrack_app/pages/splash_page.dart';
import 'package:edutrack_app/pages/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        '/onboarding2' : (context) => Onboarding2Page(),
        '/login' : (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => MainNavigation(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
