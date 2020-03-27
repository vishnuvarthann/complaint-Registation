import 'package:flutter/material.dart' ;
import 'package:flutter/widgets.dart';




class Paynow extends StatefulWidget {
     bool neeAppBar = false;
     String title ='Pay now';

Paynow({this.neeAppBar});

  @override
  _PaynowState createState() => _PaynowState();
}

class _PaynowState extends State<Paynow> {
   @override
  Widget build(BuildContext context) {
   
        return  Scaffold(
          appBar: widget.neeAppBar ? AppBar() : null,
        // appBar: AppBar(
        //     title: Text("Paynow"),
        //     ),
        body: Center(child: Text('Paynow')));
  }
}