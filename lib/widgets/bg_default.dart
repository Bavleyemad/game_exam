import 'package:flutter/material.dart';
class Bg extends StatelessWidget {
  final Widget child;  // Use `final` for immutable fields

  Bg({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 100),
          Center(child: Image.asset("assets/images/Logo Icon.png")),
          Center(child: Image.asset("assets/images/Logo Text.png")),
          SizedBox(height: 20,),
          Expanded(child: child),
        ],
      ),
    );
  }
}
