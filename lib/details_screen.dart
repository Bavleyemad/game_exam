import 'package:flutter/material.dart';
import 'package:game_exam/api/sending_model.dart';
import 'package:animate_do/animate_do.dart';

class DetailsScreen extends StatelessWidget {
  static const String routname = "fourthScreen";
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SendingModel args =
    ModalRoute.of(context)!.settings.arguments as SendingModel;

    return Scaffold(
      backgroundColor: Color(0xff06111C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: FadeInDown( // Add animation here
          child: Text(args.displayNamee ?? "Agent"),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (args.fullPortrait != null && args.fullPortrait!.startsWith('http'))
              ZoomIn( // Add animation here
                child: Image.network(
                  args.fullPortrait!,
                  fit: BoxFit.cover,
                  height: 500,
                ),
              )
            else if (args.fullPortrait != null)
              FadeIn(
                child: Text(
                  "Invalid image URL: ${args.fullPortrait}",
                  style: TextStyle(color: Colors.red, fontSize: 18.0),
                ),
              )
            else
              FadeIn(
                child: Text(
                  "No image URL provided.",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            SizedBox(height: 20),
            FadeInUp(
              child: Text(
                args.displayNamee ?? "No Name",
                style: TextStyle(color: Colors.white, fontSize: 30.0),
              ),
            ),
            FadeInUp(
              child: Text(
                args.description ?? "No description",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
            SizedBox(height: 20),
            if (args.abilities != null && args.abilities!.isNotEmpty)
              SlideInRight(
                child: Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: args.abilities!.length,
                    itemBuilder: (context, index) {
                      final ability = args.abilities![index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            if (ability.displayIcon != null)
                              Image.network(
                                ability.displayIcon!,
                                width: 50,
                                height: 50,
                              )
                            else
                              Icon(
                                Icons.image_not_supported,
                                color: Colors.white,
                                size: 50,
                              ),
                            Text(
                              ability.slot ?? "No Slot",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            else
              FadeIn(
                child: Text(
                  "No abilities available.",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
