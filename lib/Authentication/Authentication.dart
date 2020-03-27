
import 'package:flutter/material.dart';
import 'package:navigationdrawer/Network/Loader.dart';
import 'package:navigationdrawer/fragments/Loginscreen.dart';
import 'package:navigationdrawer/fragments/NavigationDrawer.dart';

class Authentication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _checkForAuthentication(),
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == true) {
                  return NavigationDrawer();
                } else {
                  return Loginscreen();
                }
              } else {
                  return Loader(
                    bckColor: Colors.red,
                  );
                }
            }));
  }

  Future<bool> _checkForAuthentication() async {
    return true;
  }
}
