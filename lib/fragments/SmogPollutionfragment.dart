

import 'package:flutter/material.dart' ;
import 'package:flutter/widgets.dart';
import 'package:navigationdrawer/Utility/AppButton.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';

class SmogPollutionfragment extends StatefulWidget {


   SmogPollutionfragment ({Key key}) : super(key: key);
     @override
  _SmogPollutionfragmentState createState() => _SmogPollutionfragmentState();
  }
  


  @override
  State<StatefulWidget> createState() {
    return null;
  }

    class _SmogPollutionfragmentState extends State<SmogPollutionfragment>{

       @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
            title: Text("Smog and pollution"),
            ),
      body:Center(
        child: Container(
        child: new Column(
           mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
                AppButton(
                   width: size.width * 0.7,
                   height: size.height * 0.1,
                   onPressed: this._onPressed,
                   title: HOME.smogPollutionRural,
                ),

             AppButton(
                   width: size.width * 0.7,
                   height: size.height * 0.1,
                   onPressed: this._onPressed,
                   title: HOME.smogPollutionUrban,
                ),
                  
                  
                 
                    // RaisedButton(
                    //   textColor: Colors.white,
                    //   color: Colors.blue,
                    //   child: Text(HOME.smogPollutionRural,style:TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.white30.withOpacity(0.8) ),),
                    //   onPressed: () => null,
                    // ),
                
                ])
     ) ));
    
             
      
     
  }
 _onPressed() {
  //  {
  //    navigateToSubPage(context);
  //  }
     }  
   
  
  }

 


 
   


 
