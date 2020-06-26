import 'package:flutter/material.dart';
import 'package:peccanteenautomation/pages/food_details_page.dart';
import 'package:peccanteenautomation/scoped_model/main_model.dart';
import 'package:peccanteenautomation/widgets/food_category.dart';
import 'package:scoped_model/scoped_model.dart';
import '../widgets/home_top_info.dart';
import '../widgets/food_category.dart';
import '../widgets/search_filed.dart';
import '../widgets/bought_foods.dart';
import '../models/food_model.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  //List<Food> _foods = foods;
  @override
  void initState() {
    // TODO: implement initState
    //widget.foodmodel.fetchFoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
        children: <Widget>[
          HomeTopInfo(),
          FoodCategory(),
          SizedBox(height: 10,),
          SearchField(),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Starred Foods",
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              GestureDetector(
                onTap: () {

                },
                child: Text("View All",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: 20.0,),
          ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model) {
              return Column(
                children: model.foods.map(_buildFoodItems).toList(),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildFoodItems(Food food) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
              FoodDetailsPage(
                food: food,
              ),
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: BoughtFoods(
          id: food.id,
          name: food.name,
          imagePath: "images/chicken_biryani.jpg",
          category: food.category,
          price: food.price,
          ratings: food.ratings,
          discount: food.discount,
        ),
      ),
    );
  }
}