import 'package:flutter/material.dart';
import 'package:peccanteenautomation/scoped_model/main_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'screens/main_screen.dart';
class App extends StatelessWidget {
  final MainModel mainModel =MainModel();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: mainModel,
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Canteen Automation',
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
        ),
        home: MainScreen(model: mainModel, ),
//        home: AddFoodItems(),
      ),
    );
  }
}