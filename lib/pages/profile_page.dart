import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peccanteenautomation/widgets/custom_list_tile.dart';
import 'package:peccanteenautomation/widgets/small_button.dart';
import '../widgets/custom_list_tile.dart';

class ProfilePage extends StatefulWidget{

  @override
  _ProfilePageState createState()=> _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage>{
  bool turnOnNotifications=false;
  bool turnOnLoaction=false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Your Profile",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.0,),),
              SizedBox(height: 20.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 150.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(75.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3.0,
                          offset: Offset(0,4.0),
                          color: Colors.black38,

                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage("images/ajith.jpg"),
                        fit: BoxFit.cover,
                      ),

                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: <Widget>[
                      Text("Ajith Kumar",style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 10.0,),
                      Text("9715526766 ",style: TextStyle(
                        color: Colors.grey,
                      ),),
                      SizedBox(height: 10.0,),
                      SmallButton(button: "Edit"),

                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.0,),
              Text("Account",style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              ),
            SizedBox(height: 20.0,),
            Card(
              elevation: 8.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),

                child: Column(
                  children: <Widget>[

                    CustomListTile(
                      icon: Icons.location_on ,
                      text: "Location",
                    ),
                    Divider(
                      height: 10.0,
                      color: Colors.grey,
                    ),
                    CustomListTile(
                      icon: Icons.visibility ,
                      text: "Change Password",
                    ),
                    Divider(
                      height: 10.0,
                      color: Colors.grey,
                    ),
                    CustomListTile(
                      icon: Icons.shopping_cart ,
                      text: "Shipping",
                    ),
                    Divider(
                      height: 10.0,
                      color: Colors.grey,
                    ),
                    CustomListTile(
                      icon: Icons.payment ,
                      text: "Payment",
                    ),
                    Divider(
                      height: 10.0,
                      color: Colors.grey,
                    ),
                  ],

                ),
              ),

            ),
              SizedBox(height: 30.0,),
              Text("Notifications",style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 20.0,),
              Card(
                elevation: 8.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("App Notification",style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.0,

                          ),
                          ),
                          Switch(
                            value: turnOnNotifications,
                            onChanged: (bool value){
                              setState(() {
                                turnOnNotifications=value;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Location Tracking",style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16.0,

                          ),
                          ),
                          Switch(
                            value: turnOnLoaction,
                            onChanged: (bool value){
                              setState(() {
                                turnOnLoaction=value;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),


            ],

          ),
        ),
      ) ,

              SizedBox(height: 30.0,),
              Text("Others",style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 20.0,),
              Card(
                elevation: 8.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 5.0,),
                        Text("Language",style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16.0,
                        ),
                        ),

                        Divider(
                          height: 30.0,
                          color: Colors.grey,
                        ),
                        Text("Currency",style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16.0,
                        ),
                        ),

                        Divider(
                          height: 30.0,
                          color: Colors.grey,
                        ),

                      ],
                    ),

                  ),
                ),
              ),
            ],
        ),
        ),
      ),
    );
  }
}