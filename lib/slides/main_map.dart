import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:travel_cash/slides/profile.dart';
//import 'package:travel_cash/states/app_state.dart';
import '../screens/home.dart';

class MainMap extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'uber clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Uber clone'),
    );
  }
}


