import 'package:flutter/material.dart';
import 'sign_in.dart';
import 'register.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/register": (BuildContext context) => Register(),
        "/login": (BuildContext context) => Login(),
      },
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget{
    @override 
    Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: Color(0xFF351C75),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset('images/photo.jpg'),
                width: 100.0,
                height: 100.0,
                ),
              SizedBox(height: 30.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 100.0,
                    
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.white,
                      
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFF351C75),
                          ),
                      ),
                      
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  ButtonTheme(
                    minWidth: 100.0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/register");
                      },
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.white,
                      
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Color(0xFF351C75),
                          ),
                      ),
                      
                    ),
                  ),
                ],
                ),
            ],
            ),
          )
        );
  }
}

