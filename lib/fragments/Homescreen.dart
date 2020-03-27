

import 'package:flutter/material.dart';
import 'package:navigationdrawer/Utility/AppButton.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';

class Homefragment extends StatefulWidget {
  @override
  _HomefragmentState createState() => _HomefragmentState();
}

class _HomefragmentState extends State<Homefragment> {
  @override
  void initState() {
    super.initState();
  
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
            body: Center(
              child:Center(
               child: Container(
                 padding: EdgeInsets.all(16.0),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                 Text(HOME.title, textAlign: TextAlign.center,
                 style: TextStyle( 
                 fontWeight: FontWeight.bold,
                 fontSize: 20.0,
              ),
            ),
           
                    AppButton(
                      id:'urban',
                      width: size.width * 0.7,
                      height: size.height * 0.1,
                      onPressed: (route, count,id) => this._clicked(route, context,id),
                      route: '/citizenservice',
                      title:HOME.citizenUrban ),
                       AppButton(
                      id:'Rural',
                      width: size.width * 0.7,
                      height: size.height * 0.1,
                      onPressed: (route, count,id) => this._clicked(route, context,id),
                      route: '/citizenservice',
                      title:HOME.citizenRural ),
                    
                       Text(HOME.loginMessage, textAlign: TextAlign.center,
                       style: TextStyle(
                       fontStyle: FontStyle.normal,
                       color: Colors.black,
                       fontWeight: FontWeight.bold,
                       decorationStyle: TextDecorationStyle.wavy,
                      fontSize: 20.0,
                              ),
                            ),
                            
                                    AppButton(
                                      id: 'allotee',
                                      width: size.width * 0.7,
                                      height: size.height * 0.1,
                                      onPressed: (route, count,id) => this._clicked(route, context,id),
                                      route: '/allotte',
                                      title: HOME.allotee,
                                    ),
                                      AppButton(
                                      id: 'authorityUser',
                                      width: size.width * 0.7,
                                      height: size.height * 0.1,
                                      onPressed: (route, count,id) => this._clicked(route, context,id),
                                      route:'/login',
                                      title: HOME.authorityUser,
                                    )
                                   
                                  ],
                                ),
                              ),
                            ),
                           ) );
                        }
                      
      _clicked(route, context,id) {
          print(route);
          print(id);
          Navigator.pushNamed(context, route,);
        }       
}
  enum Type { one, two, three }
