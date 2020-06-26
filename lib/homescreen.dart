//import 'package:flutter/material.dart';
//import 'package:peccanteenautomation/widgets/food_category.dart';
//import 'widgets/home_top_info.dart';
//import 'widgets/food_category.dart';
//import 'widgets/search_filed.dart';
//import 'widgets/bought_foods.dart';
//import 'models/food_model.dart';
//class HomeScreen extends StatefulWidget{
//  @override
//  HomeScreenState createState() => HomeScreenState();
//}
//class HomeScreenState extends State<HomeScreen>{
//  //L ist<Food> _foods = foods;
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      body:ListView(
//        padding: EdgeInsets.only(top:50.0 , left: 20.0 , right: 20.0, bottom: 10.0 ),
//        children: <Widget>[
//          HomeTopInfo(),
//          FoodCategory(),
//          SizedBox(height: 10,),
//          SearchField(),
//          SizedBox(height: 10,),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Text("Starred Foods",
//                style: TextStyle(
//                  fontSize: 16.0,
//                  fontFamily: 'Times New Roman',
//                  fontWeight: FontWeight.bold,
//                  color: Colors.black87,
//              ),
//              ),
//              GestureDetector(
//                onTap: (){
//
//                },
//                child: Text("View All",
//                  style: TextStyle(
//                    fontSize: 16.0,
//                    fontFamily: 'Times New Roman',
//                    fontWeight: FontWeight.bold,
//                    color: Colors.deepOrange,
//                  ),
//                ),
//                ),
//
//            ],
//          ),
//          SizedBox(height: 20.0,),
//          Column(
//            children: _foods.map(_buildFoodItems).toList(),
//          ),
//      ],
//      ),
//    );
//  }
//}
//Widget _buildFoodItems(Food food)
//{
//  return Container(
//    margin: EdgeInsets.only(bottom: 20.0),
//    child: BoughtFoods(
//      id: food.id,
//      name: food.name,
//      imagePath: food.imagePath,
//      category: food.category,
//      price: food.price,
//      ratings: food.ratings,
//      discount: food.discount,
//    ),
//  );
//}