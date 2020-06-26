import 'package:flutter/material.dart';
import 'package:peccanteenautomation/models/food_model.dart';
import 'package:peccanteenautomation/scoped_model/main_model.dart';
import 'package:peccanteenautomation/widgets/button.dart';
import 'package:peccanteenautomation/widgets/show_dialog.dart';
import 'package:scoped_model/scoped_model.dart';


class AddFoodItems extends StatefulWidget{
  final Food food;
  AddFoodItems({this.food});

  @override
  _AddFoodItemsState createState()=>_AddFoodItemsState();
}
class _AddFoodItemsState extends State<AddFoodItems>{
  String name;
  String category;
  String description;
  String price;
  String discount;
  GlobalKey<FormState> _foodItemFormKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldStateKey=GlobalKey();
 //  AddFoodItems({Key key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return  SafeArea(
     child: WillPopScope(
       onWillPop:(){
        Navigator.of(context).pop(false);
        return Future.value(false);
       },
       child: Scaffold(
         key: _scaffoldStateKey,
           appBar: AppBar(
             backgroundColor: Colors.white,
             centerTitle: true,
             leading: IconButton(
               icon: Icon(Icons.close, color: Colors.black,),
               onPressed: (){
                 Navigator.of(context).pop(false);
               },
             ),
             title: Text(widget.food!=null?"Update Food Items":"Add Food Items",style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 16.0,
               fontFamily: 'Times New Roman',
               color: Colors.black,

             ),),
           ),
           body: SingleChildScrollView(
             child: Container(
               padding: EdgeInsets.symmetric(horizontal: 16.0,),
               //width: MediaQuery.of(context).size.width,
               //height: MediaQuery.of(context).size.height,
                child: Form(
                  key: _foodItemFormKey,
                  child: Column(

                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 15.0,),
                        width: MediaQuery.of(context).size.width,
                        height: 170.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/image_unavailable.jpg"),
                            fit: BoxFit.fitHeight,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      _buildTextFormField("Food Name"),
                      _buildTextFormField("Category"),
                      _buildTextFormField("Description",maxLine: 5,),
                      _buildTextFormField("Price"),
                      _buildTextFormField("Discount"),
                      SizedBox(height: 70.0,),
                      ScopedModelDescendant(
                        builder: (BuildContext context, Widget child, MainModel model){
                                  return GestureDetector(
                                    onTap: () async{
                                          onSubmit(model.addFood,model.updateFood);
                                          if(model.isLoading)
                                            {
                                              showLoadingIndicator(context,widget.food !=null ? "Updating food":"Adding an item");
                                            }
                                    },
                                    child: Button(btn:widget.food!=null?"Update Food Items" :"ADD FOOD"),
                                  );
                        },
                      ),
                    ],
                  ),
                ),
             ),

           ),

       ),
     ),
   );
  }
  void onSubmit (Function addFood, Function updateFood) async
  {
    if (_foodItemFormKey.currentState.validate()){
    _foodItemFormKey.currentState.save();
    if(widget.food !=null)
    {
        Map<String,dynamic> updatedFoodItems={
          'name':name,
          'category':category,
          'description':description,
          'price':double.parse(price),
          'discount':discount!=null ?double.parse(discount):0.0,
        };
        final bool response = await updateFood(updatedFoodItems,widget.food.id);
        if (response)
          {
            Navigator.of(context).pop();
            Navigator.of(context).pop(response);

          }
        else if(!response)
          {
            Navigator.of(context).pop();
            SnackBar snackBar= SnackBar(
              duration: Duration(seconds: 2,),
              backgroundColor: Theme.of(context).primaryColor,
              content: Text("Failed to update food items",style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),),
            );
            _scaffoldStateKey.currentState.showSnackBar(snackBar);

          }

    }
    else if(widget.food==null)
      {
        final  Food food = Food(
          name: name,
          category: category,
          description: description,
          price: double.parse(price),
          discount: double.parse(discount),
        );
        bool value = await addFood(food);
        if(value){
          Navigator.of(context).pop();
          SnackBar snackBar= SnackBar(
            duration: Duration(seconds: 2,),
            content: Text("Food item successfully added"),
          );
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        }
        else if(!value)
        {
          Navigator.of(context).pop();
          SnackBar snackBar= SnackBar(
            content: Text("Failed to add food item"),
          );
          _scaffoldStateKey.currentState.showSnackBar(snackBar);

        }
      }
  }

  }

  Widget _buildTextFormField(String hint,{int maxLine=1}){
    return TextFormField(
      initialValue: widget.food != null && hint == "Food Name"
          ? widget.food.name
          : widget.food != null && hint == "Description"
          ? widget.food.description
          : widget.food != null && hint == "Category"
          ? widget.food.category
          : widget.food != null && hint == "Price"
          ? widget.food.price.toString()
          : widget.food != null && hint == "Discount"
          ? widget.food.discount.toString()
          : "",
      decoration: InputDecoration(
        hintText: "$hint",
      ),
      maxLines: maxLine,
      keyboardType: hint=="Price" ||hint=="Discount"?TextInputType.number:TextInputType.text,
      validator: (String value){
        if (value.isEmpty && hint =="Food Name"){
          return "The food name is required";
        }
        if (value.isEmpty && hint =="Category"){
          return "The food category is required";
        }
        if (value.isEmpty && hint =="Description"){
          return "The description is required";
        }
        if (value.isEmpty && hint =="Price"){
          return "The food price is required";
        }
        //return "";
        },
      onSaved: (String value){
            if(hint=="Food Name")
              {
                name=value;
              }
            if(hint=="Category")
            {
              category=value;
            }
            if(hint=="Description")
            {
              description=value;
            }
            if(hint=="Price")
            {
              price=value;
            }
            if(hint=="Discount")
            {
              discount=value;
            }
        },
    );
  }
  Widget _buildCategoryTextFormField(){
    return TextFormField();
  }
}