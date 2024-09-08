import 'package:flutter/material.dart';
import 'package:game_exam/api/api_manger.dart';

class MapsScreen extends StatefulWidget {
  static const String routname = "mapsScreen";
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ApiManger.getSourcesResponceMaps(),
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
          var maps = snapshot.data?.data;
          if (maps == null) {
            return Center(child: Text("No found"));
          }
          return SizedBox(
            width: 400,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: maps.length,
              itemBuilder: (context, index) {
                var map = maps[index];

                return Container(
                  height:200,
                  width: 200,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    image: map.splash != null
                        ? DecorationImage(
                      image: NetworkImage(map.splash!),
                      fit: BoxFit.cover,
                    )
                        : null,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 140,right: 220),
                      color: Colors.transparent,
                      padding: EdgeInsets.all(8),
                      child: Text(
                        map.displayName ?? "No Name",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
