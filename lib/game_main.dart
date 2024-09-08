
import 'package:flutter/material.dart';
import 'package:game_exam/agents_screen.dart';
import 'package:game_exam/details_screen.dart';
import 'package:game_exam/home_screen.dart';
import 'package:game_exam/maps_screen.dart';
import 'package:game_exam/splash_screen.dart';
import 'package:game_exam/weapons_screen.dart';

void main()async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(

        ),
        scaffoldBackgroundColor: Color(0xff06111C),

      ),
      routes: {
        SplashScreen.routname:(_)=>SplashScreen(),
        HomeScreen.routname:(_)=>HomeScreen(),
        AgentsScreen.routname:(_)=>AgentsScreen(),
        MapsScreen.routname:(_)=>MapsScreen(),
        WeaponsScreen.routname:(_)=>WeaponsScreen(),
        DetailsScreen.routname:(_)=>DetailsScreen()
      },
      initialRoute:SplashScreen.routname
    );
  }
}
