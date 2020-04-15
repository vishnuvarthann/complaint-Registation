import 'package:flutter/material.dart';
import 'package:navigationdrawer/CommonWidgets/SpanText.dart';
import 'package:navigationdrawer/Utility/AppButton.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';


class Allotte extends StatefulWidget {
  @override
  _State createState() => _State();
}
 
class _State extends State<Allotte> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 

 @override
  void initState() {
    super.initState();
   
  }

 
 
  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return Scaffold(
       appBar: AppBar(
            title: Text(HOME.login),
            ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      HOME_TITLE,
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                 child:  new DropdownButton<String>(
                items: <String>['A', 'B', 'C', 'D'].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (_) {},
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: LOGIN.allotNo,
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
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text(''),
                ),
                Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                      },
                    )),
                                       
                 Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child:SpanText(textvalue:ServicesHistory.note,hinttext: ServicesHistory.allotepasshit),
                     ),
                    
                Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child:SpanText(textvalue:ServicesHistory.note,hinttext:ServicesHistory.allotereghit)
                    ),
                Container(
                 padding: EdgeInsets.fromLTRB(30, 20, 20, 0),
                 child:  AppButton( id:'PdfDownloader',
                      width: size.width * 0.5,
                      height: size.height * 0.05,
                      onPressed: (route, count,id) => this._clicked(route, context,id),
                                            route: '/PdfDownloader',
                                            title:LOGIN.download),
                  )  ],
                                    
                                  )
                                  
                                  )
                                  );
                        }
                      
  _clicked(route, context,id) {
          print(route);
          print(id);
          Navigator.pushNamed(context, route,);
        }   
}
 