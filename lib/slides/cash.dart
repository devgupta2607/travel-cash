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
        child: Text('Cash Earned is ${appState.distance ~/ 1000} '),
        ),
      
    );
  }
}