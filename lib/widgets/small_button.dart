import 'package:flutter/material.dart';
class SmallButton extends StatelessWidget{
  final String button;
  SmallButton({this.button});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 25.0,
      width: 60.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueAccent,
        ),
        borderRadius: BorderRadius.circular(20.0),

      ),
      child: Center(
        child: Text("$button",style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 16.0,
        ),
        ),
      ),
    );

  }
}