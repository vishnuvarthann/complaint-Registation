import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color color;
  final double height;
  final double width;
  final String route;
  final String id;

  

  AppButton(
      {this.title = '',
       this.color = Colors.blue,
      @required this.onPressed,
      this.id,
      this.route,    
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
              
              ),
             
              ),
        height: height,
        width: width,
        margin: EdgeInsets.all(10),
        child: FlatButton(
          child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20.0,),),
          onPressed: ()=> this.onPressed(route,context,id),
        ));
  }
}
