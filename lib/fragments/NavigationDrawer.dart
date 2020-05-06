import 'package:flutter/material.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';
import 'package:navigationdrawer/fragments/Homefragment.dart';
import 'package:navigationdrawer/fragments/Paynow.dart';
import 'package:navigationdrawer/login/ServiceHistory.dart';
import 'package:navigationdrawer/login/TrackServiceAlert.dart';
import 'package:navigationdrawer/sideBar/SidebarList.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Homefragment.dart';


class NavigationDrawer extends StatefulWidget {

 final List<String> taptitles= [BOTTOMNAV.title,BOTTOMNAV.paynow,BOTTOMNAV.trackservic];

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
Widget container = Homefragment();
 int _currentIndex = 0;
 String title ="";
 
 var alertStyle = AlertStyle(
          animationType: AnimationType.fromTop,
          isCloseButton: true,
          isOverlayTapDismiss: false,
          descStyle: TextStyle(fontWeight: FontWeight.bold),
          animationDuration: Duration(milliseconds: 400),
          alertBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
              color: Colors.blue,
            ),
          ),
          titleStyle: TextStyle(
            color: Color.fromRGBO(91, 55, 185, 1.0),
          ),
        );

 final List<Widget> _children = [
    Homefragment(),
    Paynow(neeAppBar:false),
     //Paynow(),
    //BaseAlert(child:null)
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
                               title: Text(BOTTOMNAV.trackservic,style: new TextStyle(
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
                             
                           ],
                         ),);
                         
                     }
           
                     
             _tabSelected(tab) {
               
               this.setState(( ) {
                 _currentIndex = tab;
                 title = widget.taptitles[tab];
                 print(_currentIndex);
                 if (_currentIndex == 0){
                   _customizedALERT();
                                    }
                                  });
                                }
                                      
                                       
                                        _pickedOption(menu) {
                                          Navigator.pop(context);
                                      
                                          switch (menu) {
                                            case Menu.aboutus:
                                             // container = login();
                                                 Navigator.pushNamed(context, '/homepage',
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
                   
                     void _customizedALERT() {
                        Alert(
                           context: context,
                           style: alertStyle,
                           type: AlertType.none,
                           title: Trackservice.trackservice,
                           desc: Trackservice.trackhint,
                           buttons: [
                      DialogButton(
                          child: Text(
                            Trackservice.trackid,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                      onPressed: () { Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TrackServiceAlert()),);
                                                                      }
        
                              ),
        DialogButton(
          child: Text(
            Trackservice.mobileNo,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () { Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ServiceHistory()),);
                    }
        ),
      ],
    ).show();
                     }
               }
       
      

        
        