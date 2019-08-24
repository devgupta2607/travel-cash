import 'package:flutter/material.dart';
import '../states/app_state.dart';
import 'package:provider/provider.dart';

class Cash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Displaycash(),
    );
  }
}

class Displaycash extends StatefulWidget {
  @override
  _DisplaycashState createState() => _DisplaycashState();
}

class _DisplaycashState extends State<Displaycash> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/tc_logo.png',
              width: 100.0,
              height: 100.0,
            ),
            SizedBox(height: 10.0,),
            Text('${appState.distance ~/ 1000} Travel Cash Earned 🎉',
            style: TextStyle(fontSize: 20.0),),
          ],
        ),
        ),
      
    );
  }
}