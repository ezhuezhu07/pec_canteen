import 'dart:convert';
import 'package:scoped_model/scoped_model.dart';
import '../models/food_model.dart';
import 'package:http/http.dart' as http1;

class FoodModel extends Model{
  List<Food> _foods=[];
  bool _isLoading=false;
  bool get isLoading{
    return _isLoading;
  }
  List<Food> get foods{
    return List.from(_foods);
  }
  int get foodLength{
    return _foods.length;
  }
  Future <bool> addFood(Food food) async{
//   _foods.add(food);
  _isLoading=true;
  notifyListeners();
  try{
    final Map<String, dynamic> foodData={
      "name":food.name,
      "description":food.description,
      "category":food.category,
      "price":food.price,
      "discount":food.discount,
    };
    final http1.Response response = await http1.post(
        "https://canteen-automation-py01.firebaseio.com/foods.json",
        body: json.encode(foodData));
    final Map<String,dynamic> responseData=json.decode(response.body);
    Food foodWithId =Food(
      id: responseData['name'],
      name: food.name,
      description:food.description,
      category:food.category,
      price:food.price,
      discount:food.discount,
    );
    _foods.add(foodWithId);
    _isLoading=false;
    notifyListeners();
    //fetchFoods();
    return Future.value(true);
  }
  catch(e)
    {
      _isLoading=false;
    notifyListeners();
    return Future.value(false);

    }

  }

 Future <bool> fetchFoods() async{
    _isLoading=true;
    notifyListeners();
    try
    {
      final http1.Response response= await http1.get("https://canteen-automation-py01.firebaseio.com/foods.json");
      //print(response.body);
      final Map<String,dynamic> fetchedData=json.decode(response.body);
      print(fetchedData);
      final List<Food> foodItems=[];
      fetchedData.forEach((String id, dynamic foodData) {
        Food foodItem =Food(
          id: id,
          name: foodData['name'],
          description: foodData['description'],
          category: foodData['category'],
          price: double.parse(foodData['price'].toString()),
          discount: double.parse(foodData['discount'].toString()),
        );
        foodItems.add(foodItem);


      });
      _foods =foodItems;
      _isLoading= false;
      notifyListeners();
      return Future.value(true);
    }
    catch(e){
      _isLoading= false;
      notifyListeners();
      return Future.value(false);
    }
  }
  Future <bool> updateFood(Map<String,dynamic> foodData,String foodId) async{

    _isLoading = true;
    notifyListeners();

    // get the food by id
    Food theFood = getFoodItemById(foodId);

    // get the index of the food
    int foodIndex = _foods.indexOf(theFood);
    try{
      await http1.put("https://canteen-automation-py01.firebaseio.com/foods/${foodId}.json", body: json.encode(foodData));

      Food updatedFoodItems = Food(
        id: foodId,
        name: foodData["name"],
        category: foodData["category"],
        discount: foodData['discount'],
        price: foodData['price'],
        description: foodData['description'],
      );

      _foods[foodIndex] = updatedFoodItems;

      _isLoading = false;
      notifyListeners();
      return true;
    }catch(error){
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future <bool> deleteFood(String foodId) async{
    _isLoading=true;
    notifyListeners();
    try {
    final http1.Response response=  await http1.delete(
          "https://canteen-automation-py01.firebaseio.com/foods/${foodId}.json");
    //delete from list
    _foods.removeWhere((Food food) => food.id==foodId);
    _isLoading=false;
    notifyListeners();
    return Future.value(true);

    }
    catch (e)
    {
      _isLoading=false;
      notifyListeners();
      return Future.value(false);
    }
  }
  Food getFoodItemById(String foodId){
    Food food;
    for(int i=0; i<_foods.length;i++)
      {
        if(_foods[i].id == foodId)
          {
            food=_foods[i];
            break;
          }

      }
    return food;
  }
}