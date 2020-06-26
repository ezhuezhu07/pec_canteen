import 'package:flutter/material.dart';
import 'package:peccanteenautomation/pages/signin_page.dart';
import '../widgets/order_card.dart';
import '../pages/signin_page.dart';
class OrderPage extends StatefulWidget{
  @override
  _OrderPageState createState()=> _OrderPageState();
}
class _OrderPageState extends State<OrderPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
               OrderCard(),
                OrderCard(),
          OrderCard(),
          OrderCard(),
          OrderCard(),
          OrderCard(),
        ],
      ),
      bottomNavigationBar: _buildTotalContainer(),
    );

  }
  Widget _buildTotalContainer(){
    return Container(
      height: 300.0,
      margin: EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Text("Bill Summary",style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),),
         SizedBox(height: 20.0,),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
             Text("Cart Total",style: TextStyle(
               fontSize: 16.0,
               fontWeight: FontWeight.bold,
               color: Colors.grey,
             ),),

             Text("160.00",style: TextStyle(
               fontSize: 16.0,
               fontWeight: FontWeight.bold,
               color: Colors.black87,
             ),
             ),
           ],
         ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Discount",style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),),

              Text("4.80",style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Tax",style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),),

              Text("16.00",style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              ),
            ],
          ),
          Divider(height: 40.0,color: Colors.grey,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Sub Total",style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),),

              Text("172.20",style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              ),
            ],
          ),
          SizedBox(height: 20.0,),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Center(
              child:GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>SignInPage()));
                },
              child:Text("Proceed check out",style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              ),
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}