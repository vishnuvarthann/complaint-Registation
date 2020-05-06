import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navigationdrawer/CommonWidgets/AppTextField.dart';
import 'package:navigationdrawer/Utility/AppButton.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Citizendetails extends StatefulWidget {
  Citizendetails({Key key}) : super(key: key);
  @override
  _CitizendetailsState createState() => _CitizendetailsState();
}

@override
State<StatefulWidget> createState() {
  return null;
}

class _CitizendetailsState extends State<Citizendetails> {
  File _image;

  @override
  void initState() {
    super.initState();
  }

  void opencamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  void opengallery() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(HOME_TITLE)),
        body: LayoutBuilder(
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
                      margin: const EdgeInsets.only(
                          top: 20.0, left: 20.0, right: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: CitizenDetailstext.entername,
                            labelText: CitizenDetailstext.entername),
                        autofocus: false,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 20.0, left: 20.0, right: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: CitizenDetailstext.mobilenumber,
                          hintText: CitizenDetailstext.mobilenumber,
                        ),
                        autofocus: false,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 20.0, left: 20.0, right: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: CitizenDetailstext.emailaddress,
                          hintText: CitizenDetailstext.emailaddress,
                        ),
                        autofocus: false,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 20.0,
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: CitizenDetailstext.location,
                          hintText: CitizenDetailstext.location,
                        ),
                        autofocus: false,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 20.0,
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: CitizenDetailstext.complaint,
                          hintText: CitizenDetailstext.complaint,
                        ),
                        autofocus: false,
                      ),
                    ),
                    Container(
                       margin: const EdgeInsets.only(
                        top: 20.0,
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.black12,
                            height: 300.0,
                            width: 900.0,
                            child: _image == null
                                ? Text("Still waiting!")
                                : Image.file(_image),
                          ),
                          // FlatButton(
                          //   color: Colors.deepOrangeAccent,
                          //   child: Text(
                          //     "Open Camera",
                          //     style: TextStyle(color: Colors.white),
                          //   ),
                          //   onPressed: () {
                          //     opencamera();
                          //   },
                          // ),
                          // FlatButton(
                          //   color: Colors.limeAccent,
                          //   child: Text(
                          //     "Open Gallery",
                          //     style: TextStyle(color: Colors.black),
                          //   ),
                          //   onPressed: () {
                          //     opengallery();
                          //   },
                          // )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 20.0, left: 20.0, right: 20.0, bottom: 20.0),
                      child: RaisedButton(
                        onPressed: () {
                          customizedAlert();
                        },
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF0D47A1),
                                Color(0xFF1976D2),
                                Color(0xFF42A5F5),
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.all(10.0),
                          child: Text(CitizenDetailstext.sitephoto,
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: RaisedButton(
                        onPressed: () {},
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF0D47A1),
                                Color(0xFF1976D2),
                                Color(0xFF42A5F5),
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.all(10.0),
                          child: Text(CitizenDetailstext.uploaddocument,
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(30.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextField(
                              textvalue: CitizenDetailstext.concerndDetails),
                          AppTextField(
                              textvalue: CitizenDetailstext.requestdate,
                              hinttext: CitizenDetailstext.desc),
                          AppTextField(
                              textvalue: CitizenDetailstext.concernedperson,
                              hinttext: CitizenDetailstext.desc),
                          AppTextField(
                              textvalue:
                                  CitizenDetailstext.concernedpersonmobno,
                              hinttext: CitizenDetailstext.mobileno),
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(30.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppButton(
                                title: CitizenDetailstext.clear,
                                onPressed: null,
                              ),
                              AppButton(
                                title: CitizenDetailstext.submit,
                                onPressed: null,
                              )
                            ]))
                  ],
                ),
              ),
            );
          },
        ));
  }

  void customizedAlert() {
    var alert = Alert(
      context: context,
      title: "Upload Image",
      type: AlertType.none,
      buttons: [
        DialogButton(
            child: Text(
              CitizenDetailstext.camera,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
               opencamera();
              Navigator.of(context).pop();
            }),
        DialogButton(
          child: Text(
            CitizenDetailstext.gallery,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            opengallery();
          }
        )
      ],
      
    );
    alert.show();
  }
}