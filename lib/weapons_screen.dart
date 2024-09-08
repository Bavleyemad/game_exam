import 'package:flutter/material.dart';
import 'package:game_exam/api/api_manger.dart';
import 'dart:math' as math; // import this

class WeaponsScreen extends StatefulWidget {
  static const String routname = "weaponsScreen";
  const WeaponsScreen({super.key});

  @override
  State<WeaponsScreen> createState() => _WeaponsScreenState();
}

class _WeaponsScreenState extends State<WeaponsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ApiManger.getSourcesResponceWeapons(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Something went wrong"),
                ElevatedButton(
                  onPressed: () {
                    print("Error: ${snapshot.error}");
                    setState(() {});
                  },
                  child: Text("Try Again"),
                ),
              ],
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var weapons = snapshot.data?.data;
          if (weapons == null) {
            return Center(child: Text("No weapons found"));
          }

          return Center(
            child: SizedBox(
              width: 400, // Adjust width as needed
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: weapons.length,
                itemBuilder: (context, index) {
                  var weapon = weapons[index];

                  // Determine the rotation angle based on index
                  double angle = (index % 2 == 0) ? 0.2 : -0.2; // Adjust rotation angles as needed

                  return Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Card(
                      color: Color(0xff081E34),
                      elevation: 5, // Add elevation for a shadow effect
                      child: Container(
                        height: 250, // Increase height
                        width: 400, // Increase width

                        child: Stack(
                          children: [
                            Positioned(
                              child: weapon.displayIcon != null
                                  ? Transform.rotate(
                                angle:(index % 2 == 0) ? 0.2 : 6 ,
                                    child: Transform.scale(
                                scaleX: (index % 2 == 0) ? 1 : -1,

                                      child: Image.network(
                                weapon.displayIcon!,
                                fit: BoxFit.scaleDown,
                              ),
                                    ),
                                  )
                                  : Container(),
                            ),
                            Positioned(
                              top: (index % 2 == 0) ? 70 : 60,
                              right: (index % 2 == 0) ? 210 : 10,
                              child: Container(
                                height: 100,
                                width: 180,
                                color: Colors.transparent, // Semi-transparent background for text
                                //padding: EdgeInsets.all(12), // Adjust padding as needed
                                child: Column(
                                  children: [
                                    Text(
                                      weapon.displayName ?? "No Name",
                                      style: TextStyle(color: Colors.white, fontSize: 40,fontWeight: FontWeight.bold), // Larger text size
                                      textAlign: TextAlign.center,
                                    ),
                                      Text("HeavyWeapons",style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
