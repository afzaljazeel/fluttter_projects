import 'package:flutter/material.dart';
import 'package:fluttter_projects/pages/login_page.dart';
import 'package:fluttter_projects/pages/splash_screen.dart';
import 'package:fluttter_projects/pages/register_page.dart';
import 'package:fluttter_projects/pages/app_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const AppHomeScreen(),
      },
    );
  }
}
