import 'package:flutter/material.dart';
import 'package:game_exam/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routname="splashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
{
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacementNamed(context, HomeScreen.routname);
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff06111C),
      body: Padding(
          padding: EdgeInsets.all(12),
          child: Center(child: Image.asset("assets/images/Splash Screen Dark.png"))),

    ) ;
  }
}
