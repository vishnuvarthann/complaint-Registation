import 'package:flutter/material.dart' ;
import 'package:flutter/widgets.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';

class Citizenfragment extends StatefulWidget {


   Citizenfragment ({Key key}) : super(key: key);
     @override
  _CitizenfragmentState createState() => _CitizenfragmentState();
  }
  


  @override
  State<StatefulWidget> createState() {
    return null;
  }

    class _CitizenfragmentState extends State<Citizenfragment>{

       @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

     String obj = ModalRoute.of(context).settings.arguments;
     return Scaffold(

       appBar:  _apptitle(obj),
                     // title: Text("Citizen Service-Urban"),
                     
               body: Container(
                    padding: EdgeInsetsDirectional.only(start: 5,end: 5, top: 20.0),
                  
                 child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               
                 children: <Widget>[
                  
                           RaisedButton(  
                               textColor: Colors.white,
                               color: Colors.blue,
                               child: Text(HOME.maintenance,style:TextStyle(fontSize:14,fontWeight: FontWeight.bold,color: Colors.white30.withOpacity(0.8) ),),
                               onPressed: () => null,
                             ),
                           
                            RaisedButton(
                               textColor: Colors.white,
                               color: Colors.blue,
                               child: Text(HOME.sanitation,style:TextStyle(fontSize:14,fontWeight: FontWeight.bold,color: Colors.white30.withOpacity(0.8) ),),
                               onPressed: () => null,
                             ),
                       
                             RaisedButton(
                               textColor: Colors.white,
                               color: Colors.blue,
                               child: Text(HOME.horticulture,style:TextStyle(fontSize:14,fontWeight: FontWeight.bold,color: Colors.white30.withOpacity(0.8) ),),
                               onPressed: () => null,
                             ),
                             
                         ])
             ),
             );             
           }
         
           _apptitle(String obj) {
             print(obj+"hello");
                 if (obj == 'urban'){
                 return    AppBar(title: Text("Citizen Service-Urban"));

                }else {
                  return   AppBar(title: Text("Citizen Service-Rural"));
                }

           }
  }


 
   


 
