import 'package:flutter/material.dart';
import 'package:peccanteenautomation/widgets/small_button.dart';
class FoodItemCard extends StatelessWidget{
  final String name;
  final String description;
  final String price;
  FoodItemCard(this.name,this.description,this.price);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.all(10.0,),
      width: MediaQuery.of(context).size.width,
      height: 150.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [BoxShadow(
          blurRadius: 5.0,
          offset: Offset(0,3.0,),
          color: Colors.black12,
        ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/chicken_biryani.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              Text("$name",style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 15.0,),
              Container(
                width: 200.0,
                child: Text("$description",style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: 15.0,),
              Row(
                children: <Widget>[
                  Text("\u20b9 $price"),
                  SizedBox(width: 120.0,),
                  SmallButton(button: "Buy",),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}