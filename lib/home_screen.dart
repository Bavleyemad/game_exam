import 'package:flutter/material.dart';
import 'package:game_exam/agents_screen.dart';
import 'package:game_exam/details_screen.dart';
import 'package:game_exam/maps_screen.dart';
import 'package:game_exam/weapons_screen.dart';
import 'package:game_exam/widgets/bg_default.dart';
class HomeScreen extends StatefulWidget {
  static const String routname = "homeScreen";

  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var screens=[
    AgentsScreen(),
    MapsScreen(),
    WeaponsScreen()
  ];
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,  // Number of tabs
      child: Bg(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(5), // Height of the TabBar + Buttons
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TabBar(
                        onTap: (value) {

                          setState(() {
                            selectedIndex=value;
                          });
                        },

                        tabs: [
                          Tab(text: 'Agents'),
                          Tab(text: 'maps'),
                          Tab(text: 'Weapons'),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body:screens[selectedIndex]
        ),
      ),
    );
  }
}