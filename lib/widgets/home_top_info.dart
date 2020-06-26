import 'package:flutter/material.dart';

class HomeTopInfo extends StatelessWidget{
  final textstyle= TextStyle(fontSize:32.0 ,fontWeight: FontWeight.bold,fontFamily: 'Times New Roman' , );
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("What would",style: textstyle, ), //style: TextStyle(fontSize:32.0 ,fontWeight: FontWeight.bold,fontFamily: 'Times New Roman' , )),
              Text("you like to eat",style: textstyle,)
            ],
          ),

        ],
      ),
    );
  }
}