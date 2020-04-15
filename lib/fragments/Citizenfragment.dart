import 'package:flutter/material.dart' ;
import 'package:flutter/widgets.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


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
       bool viewVisible = true ;
        TextEditingController controller = new TextEditingController();
        
 
  Future<Null> getUserDetails() async {
    final response = await http.get(url);
    final responseJson = json.decode(response.body);

    setState(() {
      for (Map user in responseJson) {
        _userDetails.add(UserDetails.fromJson(user));
      }
    });
  }
       @override
  void initState() {
    super.initState();
      getUserDetails();
  }


  @override
  Widget build(BuildContext context) {
     String obj = ModalRoute.of(context).settings.arguments;
     if (obj == "urban"){
       viewVisible = true;
     }else {
         viewVisible = false;
     }
     return Scaffold(
       appBar:  _apptitle(obj),
       body: new Column(
                   children: <Widget>[
                   new  Container(
                    padding: EdgeInsetsDirectional.only(start: 5,end: 5, top: 20.0),
                    child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Padding(
                         padding: EdgeInsets.only(right: 15),
                          child: RaisedButton(  
                               textColor: Colors.white,
                               color: Colors.blue,
                               child: Text(HOME.maintenance,style:TextStyle(fontSize:16,fontWeight: FontWeight.bold,color: Colors.white30.withOpacity(0.8) ),),
                               onPressed: () => null,
                     )  ),
                         Visibility(
                           visible: viewVisible,
                           child: RaisedButton(
                               textColor: Colors.white,
                               color: Colors.blue,
                               child: Text(HOME.sanitation,style:TextStyle(fontSize:16,fontWeight: FontWeight.bold,color: Colors.white30.withOpacity(0.8) ),),
                               onPressed: () => null,
                             ),
                         ),
                           Padding(
                         padding: EdgeInsets.only(left: 15),
                           child:  RaisedButton(
                               textColor: Colors.white,
                               color: Colors.blue,
                                                                                                                                                                                                                                     child: Text(HOME.horticulture,style:TextStyle(fontSize:16,fontWeight: FontWeight.bold,color: Colors.white30.withOpacity(0.8) ),),
                               onPressed: () => null,
                             ),
                   )  ])
             ),
           Container(
            child: new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Card(
                child: new ListTile(
                  leading: new Icon(Icons.search),
                  title: new TextField(
                    controller: controller,
                    decoration: new InputDecoration(
                    hintText: 'Search', border: InputBorder.none),
                    onChanged: onSearchTextChanged,
                                      ),
                                      trailing: new IconButton(icon: new Icon(Icons.cancel), onPressed: () {
                                        controller.clear();
                                        onSearchTextChanged('');
                                      },),
                                    ),
                                  ),
                                ),
                              ),
                             
                           new Expanded(
                       child: _searchResult.length != 0 || controller.text.isNotEmpty
                ? new ListView.builder(
              itemCount: _searchResult.length,
              itemBuilder: (context, i) {
                return new Card(
                  child: new ListTile(
                    leading: new CircleAvatar(backgroundImage: new NetworkImage(_searchResult[i].profileUrl,),),
                    title: new Text(_searchResult[i].firstName + ' ' + _searchResult[i].lastName),
                  ),
                  margin: const EdgeInsets.all(0.0),
                );
              },
            )
                : new ListView.builder(
              itemCount: _userDetails.length,
              itemBuilder: (context, index) {
                return new Card(
                  child: new ListTile(
                    leading: new CircleAvatar(backgroundImage: new NetworkImage(_userDetails[index].profileUrl,),),
                    title: new Text(_userDetails[index].firstName + ' ' + _userDetails[index].lastName),
                  ),
                  margin: const EdgeInsets.all(0.0),
                );
              },
            ),
          ),]
)
);
}
                             
                               _apptitle(String obj) {
                                     if (obj == 'urban'){
                                     return    AppBar(title: Text("Citizen Service-Urban"));
                                    
                                    }else {
                                      return   AppBar(title: Text("Citizen Service-Rural"));
                    
                                    }
                    
                               }
  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
     _userDetails.forEach((userDetail) {
      if (userDetail.firstName.contains(text) || userDetail.lastName.contains(text))
        _searchResult.add(userDetail);
    });

    setState(() {});
  }
}


 List<UserDetails> _searchResult = [];
List<UserDetails> _userDetails = [];
final String url = 'https://jsonplaceholder.typicode.com/users';
class UserDetails {
  final int id;
  final String firstName, lastName, profileUrl;

  UserDetails({this.id, this.firstName, this.lastName, this.profileUrl = 'https://i.amz.mshcdn.com/3NbrfEiECotKyhcUhgPJHbrL7zM=/950x534/filters:quality(90)/2014%2F06%2F02%2Fc0%2Fzuckheadsho.a33d0.jpg'});

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return new UserDetails(
      id: json['id'],
      firstName: json['name'],
      lastName: json['username'],
    );
  }
}
   


 
