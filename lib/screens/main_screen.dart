import 'package:flutter/material.dart';
import 'package:peccanteenautomation/admin/add_food_items.dart';
import 'package:peccanteenautomation/pages/explore_page.dart';
import 'package:peccanteenautomation/scoped_model/main_model.dart';
import '../pages/home_page.dart';
import '../pages/order_page.dart';
import '../pages/explore_page.dart';
import '../pages/profile_page.dart';
class MainScreen extends StatefulWidget{
  final MainModel model;

  MainScreen({this.model});
  @override
  _MainScreenState createState()=>_MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  int currentTabIndex=0;
  List<Widget> pages;
  Widget currentPage;
  HomePage homePage;
  OrderPage orderPage;
  ExplorePage explorePage;
  ProfilePage profilePage;

  @override
  void initState() {
    homePage = HomePage();
    explorePage=ExplorePage(model: widget.model);
    orderPage=OrderPage();
    profilePage=ProfilePage();
    pages =[homePage,explorePage,orderPage,profilePage];
    currentPage=homePage;
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            currentTabIndex==0 ?"PEC Canteen App": currentTabIndex==1 ? "All Food Items": currentTabIndex==2? "Order Your Delicious Food":"Account",style: TextStyle(color: Colors.black87,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Times New Roman'),),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.notifications_none,
              //size: 30.0,
              color: Theme.of(context).primaryColor,),onPressed: (){},),
            IconButton(icon: _buildShoppingCart(),onPressed: (){}),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              ListTile(
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context)=>
                    AddFoodItems()
                    ),

                  );
                },
                leading: Icon(Icons.list),
                title: Text("Add Food Item",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),),
              ),
            ],
          ),
        ),
        resizeToAvoidBottomPadding: false,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentTabIndex,
            onTap: (int index){
              setState(() {
                currentTabIndex=index;
                currentPage=pages[index];
              });
            },
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                title: Text("Explore")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                title: Text("Orders")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text("Profile")
            ),
          ]
        ),
        body: currentPage,
       /* */
      ),
    );
  }
  Widget _buildShoppingCart()
  {
    return Stack(
      children: <Widget>[

      Icon(Icons.shopping_cart,
      //size: 30.0,
      color: Theme.of(context).primaryColor,),
      Positioned(
        top: 0.0,
       right: 0.0,
        child: Container(
          height: 12.0,
          width: 12.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.redAccent,
          ),
          child: Center(
            child: Text('1', style: TextStyle(
              fontSize: 12.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
      ),
      ],
    );
  }
}

