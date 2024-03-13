import 'package:e_commerce/ui/screens/login_screen/login_screen.dart';
import 'package:e_commerce/ui/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName:(_)=>SplashScreen(),
        LoginScreen.routeName:(_)=>LoginScreen(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}


