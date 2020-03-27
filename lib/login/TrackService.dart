import 'package:flutter/material.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';

class TrackService extends StatefulWidget {

   bool neeAppBar = false;

   TrackService({this.neeAppBar});

  @override
  _State createState() => _State();
}
 
class _State extends State<TrackService> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar: widget.neeAppBar ? AppBar() : null,

        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
               
                Container(
                    margin: const EdgeInsets.only(top: 30.0,left:20.0,right: 20.0,bottom: 20.0),
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: Trackservice.tracknumber,
                    ),
                  ),
                ),
               
                Container(
                  height: 50,
                    margin: const EdgeInsets.only(top: 10.0,left:20.0,right: 20.0,bottom: 20.0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text(Trackservice.track),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                      },
                    )),
                    Container(
                       margin: const EdgeInsets.only(top:0.0,left:20.0,right: 20.0,bottom: 20.0),
                      height: 50,
                      child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text(Trackservice.feedback),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                      },
                    )),
              ],
            )));
  }
}
 