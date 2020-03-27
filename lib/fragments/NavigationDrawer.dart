import 'package:flutter/material.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';
import 'package:navigationdrawer/fragments/Aboutfragment.dart';
import 'package:navigationdrawer/fragments/Citizendetails.dart';
import 'package:navigationdrawer/fragments/Homefragment.dart';
import 'package:navigationdrawer/fragments/Paynow.dart';
import 'package:navigationdrawer/sideBar/SidebarList.dart';

import 'Homefragment.dart';


class NavigationDrawer extends StatefulWidget {

 final List<String> taptitles= [BOTTOMNAV.home,BOTTOMNAV.paynow,BOTTOMNAV.trackservic];

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
Widget container = Homefragment();
 int _currentIndex = 0;
 String title ="";
 
 final List<Widget> _children = [
    Homefragment(),
    Paynow(neeAppBar:false),
    Citizendetails()
             ];
             @override
             Widget build(BuildContext context) {
               final taptitle = widget.taptitles[_currentIndex];
               title= taptitle;
               return Scaffold(
                drawer: Drawer(
                       child: SidebarList(
                   pickedOption: this._pickedOption,
               ),
                ),
                   appBar: AppBar(
                      title: new Text(title), ),
                   body: _children[_currentIndex],
                         bottomNavigationBar: BottomNavigationBar(
                           onTap:_tabSelected,
                           currentIndex: 0, // this will be set when a new tab is tapped
                           items: [
                             BottomNavigationBarItem(
                               icon: new Icon(
                                 Icons.home,
                                 color: Colors.blue,
                               ),
                               title: Text(BOTTOMNAV.home,style: new TextStyle(
                               fontStyle: FontStyle.normal, color: Colors.black,
                                fontWeight: FontWeight.bold,fontSize: 14.0, ),
                             ),),
                             BottomNavigationBarItem(
                               icon: new Icon(
                                 Icons.payment,
                                 color: Colors.blue,
                               ),
                               title: new Text(BOTTOMNAV.paynow,style: new TextStyle(
                               fontStyle: FontStyle.normal, color: Colors.black,
                                fontWeight: FontWeight.bold,fontSize: 14.0, ),),
                             ),
                             BottomNavigationBarItem(
                               icon: new Icon(
                                 Icons.track_changes,
                                 color: Colors.blue,
                               ),
                               title: new Text(BOTTOMNAV.trackservic,style: new TextStyle(
                               fontStyle: FontStyle.normal, color: Colors.black,
                                fontWeight: FontWeight.bold,fontSize: 14.0, ),),
                             ),
                           ],
                         ),);
                         
                     }
           
                     
             _tabSelected(tab) {
               
               this.setState(( ) {
                 _currentIndex = tab;
                 title = widget.taptitles[tab];
               });
             }
                   
                     _moveToNotes(context) {
                       Navigator.push(
                           context, MaterialPageRoute(builder: (context) => Aboutfragment()));
                     }
                   
                     _pickedOption(menu) {
                       Navigator.pop(context);
                   
                       switch (menu) {
                         case Menu.aboutus:
                          // container = login();
                              Navigator.pushNamed(context, '/about',
                               arguments: {'type': Menu.aboutus});
                           break;
                   
                         case Menu.faq:
                           // container = Faqfragment();
                            Navigator.pushNamed(context, '/faq',
                               arguments: {'type': Menu.faq});
                           break;
                   
                          case Menu.feedback:
                          // container = Feedbackfragment();
                              Navigator.pushNamed(context, '/Feedback',
                               arguments: {'type': Menu.feedback});
                             
                           break;
                   
                          case Menu.smog:
                          //  container = SmogPollutionfragment();
                             Navigator.pushNamed(context, '/smogandpollution',
                               arguments: {'type': Menu.smog});
                           break;
                           
                          case Menu.markmyattendance:
                          Navigator.pushNamed(context, '/login',
                            arguments: {'type': Menu.markmyattendance});
                          
                       }
                       this.setState(() => {});
                       print(menu);
                     }
           
             static showAlertDialog(Type buildContext, BuildContext context) {}
               }
       
       _customizedAlert(BuildContext context) {
            showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(''),
              content: Text(''),
              actions: <Widget>[
                FlatButton(
                  child: Text("TrackId"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                 FlatButton(
                  child: Text("Mobile No"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ));
}
        
        