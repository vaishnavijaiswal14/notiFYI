import 'package:flutter/material.dart';
import 'package:my_notifyi/admin_home.dart';
import 'package:my_notifyi/admin_login.dart';
import 'package:my_notifyi/home.dart';
import 'package:my_notifyi/login.dart';
import 'package:my_notifyi/settings.dart';
import 'package:my_notifyi/signup.dart';
import 'package:my_notifyi/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        '/login': (context) =>  const Login(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const Home(),
        '/settings': (context) =>  SettingsPage(
      email: 'btbtc21032_vaishnavi@banasthali.in',
    ),
  
      },
    );
  }
}
