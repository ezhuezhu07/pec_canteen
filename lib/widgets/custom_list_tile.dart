import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget{
  final IconData icon;
  final String text;
  CustomListTile({this.icon,this.text});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0,),
      child: Row(

        children: <Widget>[
          Icon(icon ,color: Colors.blueAccent,),
          SizedBox(width: 15.0,),
          Text("$text",style: TextStyle(fontSize: 16.0,),),
        ],
      ),
    );

  }
}