import 'package:flutter/material.dart';
import 'package:peccanteenautomation/scoped_model/main_model.dart';
import 'package:scoped_model/scoped_model.dart';
import '../pages/signin_page.dart';

class SignUpPage extends StatefulWidget{
  @override
  _SignUpPageState createState()=> _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage>{
  bool _togglevisiblity= true;
  //bool _togglevisiblity1= true;
  String _email;
  String _username;
  String _password;
  String _confirmPassword;
  GlobalKey<FormState> _formkey= GlobalKey();
  Widget _buildEmailTextField(
      ){

    return TextFormField(
      decoration: InputDecoration(
        hintText: "Pec mail or other mail",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String email){
        _email=email;
      },
      validator: (String email){
        String errorMessage;
        if(!email.contains("@pec.edu"))
          {
            errorMessage='only pec ids are valid';
          }
        if(email.isEmpty)
          {
            errorMessage='Your pec mail is required';
          }
        return errorMessage;
      },
    );

  }
  Widget _buildUserTextField(
      ){

    return TextFormField(
      decoration: InputDecoration(
        hintText: "User name or Student Reg id",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String username){
        _username=username.trim();
      },
      validator: (String username){
    String errorMessage;
    if (username.isEmpty)
    {
    errorMessage='Username field is required';
    }
    if (username.length < 7)
    {
        errorMessage='Username is too short';
    }
    return errorMessage;
  },
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
      onSaved: (String password){
        _password=password;
      },
      validator: (String password){
        String errorMessage;
        if(password.isEmpty)
        {
          errorMessage='Your password is required';
        }
        return errorMessage;
      },
    );
  }
//  Widget _buildConfirmPasswordTextField(
//      ){
//    return TextFormField(
//      decoration: InputDecoration(
//        hintText: "Confirm Password",
//        hintStyle: TextStyle(
//          color: Color(0xFFBDC2CB),
//          fontSize: 18.0,
//        ),
//        suffixIcon: IconButton(
//          onPressed: (){
//            setState(() {
//              _togglevisiblity1=!_togglevisiblity1;
//            });
//          },
//          icon:_togglevisiblity1 ? Icon(Icons.visibility_off):Icon(Icons.visibility),
//        ),
//      ),
//      obscureText: _togglevisiblity1,
//      onSaved: (String value){
//
//      },
//    );
//}

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.black26,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child:Form(
            key: _formkey,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top:0.0),
                height: 70.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  //color: Color.fromARGB(255, 000, 102, 153),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                    height: 60.0,
                    width: 50.0 ,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/peclogo.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                    SizedBox(height: 20.0,width: 20.0,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                  GestureDetector(
                  child:Text("SIGN UP",style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.normal,
                    color: Colors.deepPurpleAccent,
                  ),
                  ),
                  ),
                ],
              ),
              SizedBox(height:20.0,),

              Card(
                elevation: 5.0,
                child:Padding(
                  padding: EdgeInsets.all(20.0),

                  child: Column(
                    children: <Widget>[
                      _buildUserTextField(),
                      SizedBox(height: 10.0,),
                      _buildEmailTextField(),
                      SizedBox(height: 10.0,),
                      _buildPasswordTextField(),
//                    SizedBox(height: 10.0,),
//                    _buildConfirmPasswordTextField(),
                    ],

                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              _buildSignupButton(),
              Divider(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?",style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xFFBDC2CB),
                  ),),
                  SizedBox(width: 10.0,),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>SignInPage()));
                    },
                    child: Text("Sign in",style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.bold,
                    ),),
                  )
                ],
              )
            ],
          ),
      ),
        ),
      ),
    );

  }
  Widget _buildSignupButton()
  {
    return ScopedModelDescendant(
      builder: (BuildContext sctx, Widget child, MainModel model){
          return GestureDetector(
            onTap: (){
              onSubmit(model.authenticate);
            },
            child: Container(
              height: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.deepPurpleAccent,
              ),
              child: Center(
                child: Text("Sign Up",style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
            ),
          );
      }
    );
  }
  void onSubmit(Function authenticate)
  {
    if (_formkey.currentState.validate())
      {
        _formkey.currentState.save();

        print("Email: $_email, password: $_password");
        authenticate(_email,_password);
      }
    else
      {
        print("failed validation");
      }

  }
}