import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 75.0,
            width: 45.0,
            decoration: BoxDecoration(
              border: Border.all(width: 2.0,color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap:(){},
                  child:Icon(Icons.add ,color: Colors.green,),
          ),
                Text("0",style: TextStyle(fontSize: 18.0),),
                InkWell(
                  onTap:(){},
                  child:Icon(Icons.remove, color: Colors.red,),
                ),

              ],
            ),
          ),
          SizedBox(width: 20.0,),
          Container(
            height: 70.0,
            width: 70.0,
            
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/chicken_noodles.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(35.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5.0,
                  offset: Offset(5.0,5.0),
                ),
              ],
            ),
          ),
          SizedBox(width: 20.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              Text("Chicken Noodles",style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 7.0,),
              Text("\u20b9 80.0",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.blueAccent
              ),),
              SizedBox(height: 7.0,),
              Container(
                width: 120.0,
                height: 25.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Sauce",style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,color: Colors.grey,
                ),),
                        SizedBox(width: 5.0,),
                        InkWell(
                          onTap: (){},
                          child: Text("x",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                        ),
                        ),
                        ),
                      ],
                    ),
                  ],
                ),

              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){},
            child:Icon(Icons.cancel,color: Colors.grey,),
          ),

        ],
      ),
      ),
    );
  }
}