import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class UserModel extends Model{
  //User _authenticatedUser;
  void authenticate(String email, String password) async
  {
    Map<String, dynamic> authData={
      "email":email,
      "password":password,
      "returnSecureToken": true,
    };
    try{
    http.Response response=await  http.post("https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCeRF8K3ZvJhG0XPGuZ6IY6CkyzyKAGMIc",
      body: json.encode(authData),
         headers:{"Conetent-Type": "application/json"},
      );
    print("The response : ${response.body}");
    }
    catch(error)
    {
      print("The error in sign up $error");
    }
  }
}