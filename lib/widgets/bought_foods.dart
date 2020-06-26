import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoughtFoods extends StatefulWidget{
  final String id;
  final String name;
  final String imagePath;
  final String category;
  final double price;
  final double ratings;
  final double discount;

  BoughtFoods({this.id,this.name,this.imagePath,this.category,this.price,this.ratings,this.discount});
  @override
  _BoughtFoodsState createState()=>_BoughtFoodsState();
}
class _BoughtFoodsState extends State<BoughtFoods>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child:Stack(
      children: <Widget>[
        
          
        Container(
          height: 200.0,
          width: 400.0,
          child:Material(
            borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(widget.imagePath, fit: BoxFit.cover,),
        ),
        ),
          //Material(
            //borderRadius: BorderRadius.only(topLeft: Radius.zero,topRight: Radius.zero,bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
          Positioned(
            left: 0.0,
            bottom: 0.0,
          child:Container(
            height: 80.0,
            width:400.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors:[
                  Colors.black87,Colors.black38

                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          ),
          //),
        Positioned(
          left: 10.0,
          bottom: 10.0,
        child: Row(
          children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      widget.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Times New Roman') ,
                  ),
                  SizedBox(height: 5.0,),
                  Row(
                    children: <Widget>[
                      Icon(Icons.star, color: Theme.of(context).primaryColor,size: 16.0,),
                      Icon(Icons.star, color: Theme.of(context).primaryColor,size: 16.0,),
                      Icon(Icons.star, color: Theme.of(context).primaryColor,size: 16.0,),
                      Icon(Icons.star, color: Theme.of(context).primaryColor,size: 16.0,),
                      Icon(Icons.star, color: Theme.of(context).primaryColor,size: 16.0,),
                      Text("("+5/*widget.ratings*/.toString() +" Reviews)",style: TextStyle(
                        color: Colors.grey,fontSize: 14.0,

                      ),
                      ),
                    ],
                  ),
            Row(
              children: <Widget>[
                Text(
                  widget.category,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Times New Roman') ,

              ),
          ],
        ),
        ],
        ),
        ],
        ),
        ),
                Positioned(
                right: 10.0,
                bottom: 10.0,
                child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        widget.price.toString(),style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent,
                        fontSize: 18.0,
                      ),
                      ),
                      Text(

                        "Min Order",style: TextStyle(
                          color: Colors.grey
                      ),
                      )
                    ],
                  ),
                      ],
                      ),
                ),
      ],
    ),
    );
  }
}