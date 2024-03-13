import 'package:e_commerce/ui/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  static String routeName = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushNamed(context, LoginScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset("assets/images/splash.png",
            fit: BoxFit.fill,)
      ),
    );
  }
}
