import 'package:flutter/material.dart';
import 'package:peccanteenautomation/widgets/button.dart';
import '../pages/signup_page.dart';
class SignInPage extends StatefulWidget{
  @override
  _SignInPageState createState()=> _SignInPageState();
}
class _SignInPageState extends State<SignInPage>{
  bool _togglevisiblity= true;
  Widget _buildEmailTextField(
      ){

    return TextFormField(
      decoration: InputDecoration(
        hintText: "Pec mail or Student Reg id",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
    );
  }
  Widget _buildPasswordTextField(
      ){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
        suffixIcon: IconButton(
          onPressed: (){
            setState(() {
              _togglevisiblity=!_togglevisiblity;
            });
          },
          icon:_togglevisiblity ? Icon(Icons.visibility_off):Icon(Icons.visibility),
        ),
      ),
      obscureText: _togglevisiblity,
    );
  }

    @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),

        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top:0.0),
                height: 70.0,
                width: 400.0 ,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 000, 102, 153),
                    ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[ Container(
                height: 70.0,
                width: 70.0 ,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/peclogo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                ),
                SizedBox(height: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Pondicherry Engineering College",style: TextStyle(
                      fontSize: 17.0,
                      fontFamily: 'Times New Roman',
                       fontWeight: FontWeight.bold,
                        color: Colors.white,
                    ),),
                    SizedBox(height: 5.0,),
                    Text("(An Autonomous Institution of Govt. of Puducherry)",style: TextStyle(
                      fontSize: 8.0,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),),
                    SizedBox(height: 5.0,),
                    Text("Affiliated to Pondicherry University",style: TextStyle(
                      fontSize: 8.0,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),),


                  ],
                ),
                  ],
                ),
            ),
            SizedBox(height:10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("PEC Canteen Automation",style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'Times New Roman',
              fontWeight: FontWeight.normal,
              color: Colors.deepPurpleAccent,
            ),),],),
            SizedBox(height: 20.0,),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Text("SIGN IN",style: TextStyle(
            fontSize: 25.0,
            fontFamily: 'Times New Roman',
            fontWeight: FontWeight.normal,
              color: Colors.deepPurpleAccent,
            ),),
              ],
            ),
            SizedBox(height:60.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("Forgotten Password?",style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.deepPurpleAccent,
                  ),),

                ],
            ),
            SizedBox(height: 10.0,),
            Card(
              elevation: 5.0,
              child:Padding(
                padding: EdgeInsets.all(20.0),

                   child: Column(
                children: <Widget>[
                  _buildEmailTextField(),
                  SizedBox(height: 10.0,),
                  _buildPasswordTextField(),
                ],

              ),
            ),
            ),
            SizedBox(height: 20.0,),
            Button(btn:"Sign In"),
            Divider(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account?",style: TextStyle(
                  fontSize: 15.0,
                  color: Color(0xFFBDC2CB),
                ),),
                SizedBox(width: 10.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>SignUpPage()));
                  },
                  child:Text("Sign Up",style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.normal,
                    color: Colors.deepPurpleAccent,
                  ),
                  ),
                ),
              ],
            )
              ],
              ),
            ),
        );
  }
}