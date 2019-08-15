import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        backgroundColor: Color(0xFF351C75),
        body: Center(
          child: SingleChildScrollView(
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,       
              children: <Widget>[
                Container(
                  child: Image.asset('images/logo.png'),
                  width: 100.0,
                  height: 100.0,
                ),
                Text(
                  'Travel Cash',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Hello',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 30.0,
                          color: Color(0xFF351C75),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Sign into your Account',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20.0,
                          color: Color(0xFF351C75),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Email ID*',
                          suffixIcon: Icon(Icons.email),
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password*',
                          suffixIcon: Icon(FontAwesomeIcons.eyeSlash),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          'Forgot Password ?',
                          textAlign: TextAlign.left,
                          
                          style: TextStyle(
                            fontSize: 10.0, 
                            color: Colors.grey,
                            ),
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 300.0,
                        child: RaisedButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                          color: Color(0xFF351C75),
                          
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              ),
                          ),
                          
                          ),
                      )

                    ],
                    ),
                ),
                  ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
