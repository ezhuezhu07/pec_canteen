import 'package:flutter/material.dart';

class SearchField extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 5.0),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          //under search box it give some (shadow)elevation
          child:TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 32.0,vertical: 16.0),
            hintText: "Search food",
            suffixIcon: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(30.0),
              child:Icon(Icons.search,
              color: Colors.black87,
              ),
            ),
              border: InputBorder.none
            ),

          ),
        ),
      );
  }
}