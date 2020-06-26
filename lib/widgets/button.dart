import 'package:flutter/material.dart';
class Button extends StatelessWidget{
  //  AddFoodItems({Key key }) : super(key: key);
  final String btn;
  Button({this.btn});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 45.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.deepPurpleAccent,
      ),
      child: Center(
        child: Text(
          "$btn",style: TextStyle(
          fontSize: 18.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
    );
  }
}



