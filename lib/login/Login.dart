import 'package:flutter/material.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';

class Login extends StatefulWidget {
  @override
  _State createState() => _State();
}
 
class _State extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   bool _validate = false;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Text(HOME.authLogin),
            ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
               
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: LOGIN.username,
                         errorText: _validate ? 'Please Enter username' : null,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: LOGIN.password,
                      errorText: _validate ? 'Please Enter Password' : null,
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                     
                  },
                  textColor: Colors.blue,
                  child: Text(''),
                ),
                Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      child: Text('Login'),
                      onPressed: () {
                        if (passwordController.text.isEmpty  || nameController.text.isEmpty){
                                setState(() {
                                      nameController.text.isEmpty ? _validate = true : _validate = false;
                                      passwordController.text.isEmpty ? _validate = true : _validate = false;
                                     });
                        }
                      },
                    )),
              ],
            )));
  }
}                                                   
 