import 'package:flutter/material.dart' ;
import 'package:flutter/widgets.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';

class Citizendetails extends StatefulWidget {

   Citizendetails ({Key key}) : super(key: key);
     @override
  _CitizendetailsState createState() => _CitizendetailsState();
  }
  


  @override
  State<StatefulWidget> createState() {
    return null;
  }

    class _CitizendetailsState extends State<Citizendetails>{

       @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
      return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                   new DropdownButton<String>(
                      items: <String>['A', 'B', 'C', 'D'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                         
                        );
                      }).toList(),
                      onChanged: (_) {},
                    
),
Container(

               //  child: RadioWidget(),
                         ),
                       Container(
                          margin: const EdgeInsets.only(top:20.0,left:20.0,right: 20.0),
                          child: TextField(
                          decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText:CitizenDetailstext.entername,
                          labelText:CitizenDetailstext.entername
                       ),
                       autofocus: false,
                     ),),
                       Container(
                           margin: const EdgeInsets.only(top:20.0,left:20.0,right: 20.0),
                         child: TextField(
                         decoration: InputDecoration(
                         border: OutlineInputBorder(),
                         labelText:CitizenDetailstext.mobilenumber,
                         hintText:CitizenDetailstext.mobilenumber,
                       ),
                       autofocus: false,
                     ),),
                       Container(
                         margin: const EdgeInsets.only(top:20.0,left:20.0,right: 20.0),
                         child: TextField(
                         decoration: InputDecoration(
                         border: OutlineInputBorder(),
                         labelText:CitizenDetailstext.emailaddress,
                         hintText:CitizenDetailstext.emailaddress,
                       ),
                       autofocus: false,
                     ),),
                       Container(
                         margin: const EdgeInsets.only(top:20.0,left:20.0,right: 20.0,),
                         child: TextField(
                         keyboardType: TextInputType.multiline,
                         maxLines: 5,
                         decoration: InputDecoration(
                         border: OutlineInputBorder(),
                         labelText:CitizenDetailstext.location,
                         hintText:CitizenDetailstext.location,
                       ),
                       autofocus: false,
                     ),),
                Container(
                         margin: const EdgeInsets.only(top:20.0,left:20.0,right: 20.0,),
                         child: TextField(
                         keyboardType: TextInputType.multiline,
                         maxLines: 5,
                         decoration: InputDecoration(
                         border: OutlineInputBorder(),
                         labelText:CitizenDetailstext.complaint,
                         hintText:CitizenDetailstext.complaint,
                       ),
                       autofocus: false,
                     ),),
                      Container(
                        margin: const EdgeInsets.only(top:20.0,left:20.0,right: 20.0,bottom: 20.0),
                        child:  RaisedButton(
                         onPressed: () {},
                         textColor: Colors.white,
                         padding: const EdgeInsets.all(0.0),
                         child: Container(
                            decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                         colors: <Color>[
                                         Color(0xFF0D47A1),
                                         Color(0xFF1976D2),
                                         Color(0xFF42A5F5),],),
                                         ),
                             padding: const EdgeInsets.all(10.0),
                             child: Text(CitizenDetailstext.sitephoto,style: TextStyle(fontSize: 20)),
                            ),
                           ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left:20.0,right: 20.0),
                        child:  RaisedButton(
                         onPressed: () {},
                         textColor: Colors.white,
                         padding: const EdgeInsets.all(0.0),
                         child: Container(
                            decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                         colors: <Color>[
                                         Color(0xFF0D47A1),
                                         Color(0xFF1976D2),
                                         Color(0xFF42A5F5),],),
                                         ),
                             padding: const EdgeInsets.all(10.0),
                             child: Text(CitizenDetailstext.uploaddocument,style: TextStyle(fontSize: 20)),
                            ),
                           ),
                      ),
                       Container(
                          child: new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                                                  children: <Widget>[
                               new Text(CitizenDetailstext.requestdate),
                               new Text(CitizenDetailstext.concernedperson),],
                               ),
                               )],         
            ),
          ),
        );
      },
    );
   }
  }
  
 

  
  


 
   


 
