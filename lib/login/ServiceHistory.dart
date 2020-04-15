import 'package:flutter/material.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';

class ServiceHistory extends StatefulWidget {
 

  @override
  _State createState() => _State();
}
 
class _State extends State<ServiceHistory> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Text(HOME.trackServices),
            ),
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
                      labelText: ServicesHistory.mobilenumber,
                    ),
                  ),
                ),
               
               
                    Container(
                       margin: const EdgeInsets.only(top:20.0,left:20.0,right: 20.0,bottom: 20.0),
                      height: 50,
                      child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text(FeedBack.submit),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                      },
                    )),
              ],
            )));
  }
}
 