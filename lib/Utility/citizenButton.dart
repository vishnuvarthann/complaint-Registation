import 'package:flutter/material.dart';

class CitizenButton extends StatelessWidget {

   final String title;
  final Function onPressed;
  final Color color;
  final double height;
  final double width;

   CitizenButton(
      {this.title = '',
      @required this.onPressed,
      this.color =  Colors.blue,
      this.height,
      this.width});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF0D47A1),
                  Color(0xFF1976D2),
                  Color(0xFF42A5F5),
                ],
              )),
        height: height,
        width: width,
        margin: EdgeInsets.all(10),
        child: RaisedButton(
          child: Text(title, style: TextStyle(color: Colors.white, fontSize: 15.0,),),
          // shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.all(Radius.circular(38.0))),
          onPressed: this.onPressed(),
        ));
  }
 
 
}
