import 'package:flutter/material.dart';
//import './slides/maps.dart';
import './slides/intro_slider.dart';
//import './slides/profile.dart';
import 'package:provider/provider.dart';
import 'package:travel_cash/states/app_state.dart';

void main() {
  return runApp(MultiProvider(providers: [
      ChangeNotifierProvider.value(value: AppState(),)
  ],
  child: MyApp(),));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Introapp();
  }
}