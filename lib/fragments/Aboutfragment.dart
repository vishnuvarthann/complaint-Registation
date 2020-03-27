import 'package:flutter/material.dart' ;
import 'package:flutter/widgets.dart';




class Aboutfragment extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
            title: Text("About"),
            ),
        body: Center(child: Text('about')));
  }
  
}