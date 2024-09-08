import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:game_exam/api/api_manger.dart';
import 'package:game_exam/api/sending_model.dart';
import 'package:game_exam/details_screen.dart';

class AgentsScreen extends StatefulWidget {
  static const String routname = "agentsScreen";
  const AgentsScreen({super.key});

  @override
  State<AgentsScreen> createState() => _AgentsScreenState();
}

class _AgentsScreenState extends State<AgentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ApiManger.getSourcesResponce(),
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
          var agents = snapshot.data?.data;
          if (agents == null) {
            return Center(child: Text("No agents found"));
          }

          return CarouselSlider.builder(

            itemCount: agents.length,
            itemBuilder: (context, index, realIndex) {
              var agent = agents[index];
              Color? firstColor, fourthColor;
              print(agent.backgroundGradientColors);
              if (agent.backgroundGradientColors != null &&
                  agent.backgroundGradientColors!.length >= 4) {
                firstColor = _hexToColor(agent.backgroundGradientColors![0]);
                print("ffff${firstColor}");
                fourthColor = _hexToColor(agent.backgroundGradientColors![3]);
              } else {
                firstColor = Colors.grey;
                fourthColor = Colors.grey.shade700;
              }

              return Stack(
                clipBehavior: Clip.none,
                children: [

                  Container(
                    width: 350,
                    height: 450,
margin: EdgeInsets.only(top: 80),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [firstColor, fourthColor],
                       transform:  GradientRotation(0.2),
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(120),
                        bottomRight:Radius.circular(120),topRight: Radius.circular(40),bottomLeft: Radius.circular(40)),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20,right: 100),
                        color: Colors.transparent,
                        child: Text(
                          agent.displayName ?? "No Name",
                          style: TextStyle(color: Colors.white, fontSize: 30.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  if (agent.fullPortraitV2 != null)
                    Positioned(
                      bottom: 150,
 left: -80,
                      child: InkWell(
                        onTap: (){
                          var sendingModel = SendingModel(
                             agent.fullPortraitV2,
                             agent.displayName,
                            agent.description,
                            agent.abilities
                          );

                          Navigator.pushNamed(context, DetailsScreen.routname,arguments:sendingModel );
                          },
                        child: Image.network(
                          agent.fullPortraitV2!,
                          fit: BoxFit.contain,
                          height: 450, // Adjust the height as needed
                        ),
                      ),
                    ),
                ],
              );
            },
            options: CarouselOptions(
              height: 600,
              enableInfiniteScroll: true,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          );
        },
      ),
    );
  }
  Color _hexToColor(String hex) {
    // Remove the last two characters
    String cleanedHex = hex.length > 2 ? hex.substring(0, hex.length - 2) : hex;

    // Ensure the cleanedHex has the correct length (8 characters)
    if (cleanedHex.length == 6) {
      cleanedHex = "FF$cleanedHex"; // Add the alpha channel if missing
    }

    // Convert the cleanedHex string to a Color
    return Color(int.parse(cleanedHex, radix: 16));
  }





}
