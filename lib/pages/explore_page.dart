import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peccanteenautomation/admin/add_food_items.dart';
import 'package:peccanteenautomation/scoped_model/main_model.dart';
import 'package:peccanteenautomation/widgets/food_item_card.dart';
import 'package:peccanteenautomation/widgets/show_dialog.dart';
import 'package:scoped_model/scoped_model.dart';
class ExplorePage extends StatefulWidget{
  final MainModel model;
  ExplorePage({this.model});
  @override
  _ExplorePageState createState()=> _ExplorePageState();
}
class _ExplorePageState extends State<ExplorePage>{
  GlobalKey<ScaffoldState> _explorePageScaffoldkey= GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.model.fetchFoods();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _explorePageScaffoldkey,
      backgroundColor: Colors.white,
          body: ScopedModelDescendant<MainModel>(
            builder: (BuildContext sctx, Widget child,MainModel model)
    {
      //model.fetchFoods();
     // List<Food> foods = model.foods;
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: RefreshIndicator(
          onRefresh: model.fetchFoods,
          child: ListView.builder(
              itemCount: model.foodLength,
            itemBuilder: (BuildContext lctx,int index){
                return GestureDetector(
                  onTap: () async{
                    final bool response = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context)=>AddFoodItems(
                        food: model.foods[index],
                      ),
                      ),
                    );
                    if(response)
                      {
                        SnackBar snackBar= SnackBar(
                          duration: Duration(seconds: 2,),
                          backgroundColor: Theme.of(context).primaryColor,
                          content: Text("Food item successfully updated",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),),
                        );
                        _explorePageScaffoldkey.currentState.showSnackBar(snackBar);
                      }
                  },
                  onDoubleTap: (){
                          showLoadingIndicator(context, "Deleting Food item...");
                          model.deleteFood(model.foods[index].id,).then((bool response){
                            Navigator.of(context).pop();
                          });
                  },
                  child: FoodItemCard(
              model.foods[index].name,
                    model.foods[index].description,
                    model.foods[index].price.toString(),
              ),
                );

            },
          ),
        ),
      );
    },


  ),
    );
  }
}