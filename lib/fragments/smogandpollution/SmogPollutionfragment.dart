

import 'package:flutter/material.dart' ;
import 'package:flutter/widgets.dart';
import 'package:navigationdrawer/Utility/AppButton.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';
import 'package:navigationdrawer/fragments/smogandpollution/smollandpollutiondetail.dart';

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
           mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
                AppButton(
                   id:'SER_SPRRR',
                   width: size.width * 0.7,
                   height: size.height * 0.08,
                   title: HOME.smogPollutionRural,
                   onPressed: (route, count,id) => this._clicked(route, context,id),
                   route:'/Smollandpollutiondetail',),
                   
                 AppButton(
                          id:'SER_SPRUR',
                          width: size.width * 0.7,
                          height: size.height * 0.08,
                          title: HOME.smogPollutionUrban,
                          onPressed: (route, count,id) => this._clicked(route, context,id),
                          route:'/Smollandpollutiondetail',
                           ), ])
                        ) ));
  
                        
                     }
                     _clicked(route, BuildContext context, id) {
                       if (id == 'SER_SPRRR'){
                         id = '%27SER_UBSAN%27';
                       }else{
                          id = '%27SER_SPRUR%27';
                       }
                         Navigator.of(context).push(MaterialPageRoute(
                           builder: (context) =>
                            Smollandpollutiondetail(id)));
                     }  
   
  
  }

 


 
   


 
