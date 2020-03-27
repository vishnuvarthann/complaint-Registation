import 'package:flutter/material.dart';

class TextView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Text("Styling text in Flutter",
        style: TextStyle(
          fontSize: 30.0,
        ),
      );
    }
}