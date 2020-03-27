import 'package:flutter/material.dart' ;
import 'package:flutter/widgets.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';

class Feedbackfragment extends StatefulWidget{

FeedbackfragmentWidget  createState() => FeedbackfragmentWidget();

}

class FeedbackfragmentWidget extends  State {
  double rating = 3 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(FeedBack.feedback),
            ),
      
     body: Center(child: Text('FeedBack')));
}
}