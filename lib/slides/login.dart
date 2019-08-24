//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../util/user.dart';
import '../slides/profile.dart';
import '../components/googy.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {"/profile": (BuildContext context) => Profile()},
      home: Scaffold(
        
        backgroundColor: Colors.grey.shade200,
        body: Stack(
          children: <Widget>[
            Background(),
            Center(
              child: SingleChildScrollView(
                child: Column( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,       
                  children: <Widget>[
                    Card(
                      elevation: 3.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Login',
                            style: TextStyle(
                              fontFamily: 'Roboto-Thin',
                              fontSize: 30.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Email ID*',
                              suffixIcon: Icon(Icons.email),
                            ),
                            controller: emailController,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Password*',
                              suffixIcon: Icon(FontAwesomeIcons.eyeSlash),
                            ),
                            controller: passwordController,
                          ),
                          SizedBox(height: 20.0,),
                          ButtonTheme(
                            minWidth: 300.0,
                            child: RaisedButton(
                              onPressed: () async{
                                Map<String,dynamic> data = await userObject.login(emailController.text,passwordController.text);
                                if (data["success"] == true) {
                                    Navigator.pushReplacementNamed(context, "/profile");
                                } else {
                                  // refresh login screen
                                }
                              },
                              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                              
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  
                                  color: Colors.white,
                                  ),
                              ),
                              
                              ),
                          ),

                        ],
                        ),
                    ),
                      ),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
