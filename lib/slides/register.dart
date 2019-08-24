import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_cash/components/googy.dart';
import '../util/user.dart';
import '../slides/login.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {"/login": (BuildContext context) => Login()},
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
                      elevation: 2.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Create Account',
                            style: TextStyle(
                              fontFamily: 'Roboto-Light',
                              fontSize: 30.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Name*',
                              suffixIcon: Icon(Icons.person),
                            ),
                            controller: nameController,
                          ),

                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Age*',
                              suffixIcon: Icon(FontAwesomeIcons.birthdayCake),
                            ),
                            controller: ageController,
                            keyboardType: TextInputType.number,
                          ),

                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Gender*',
                              suffixIcon: Icon(FontAwesomeIcons.venusMars),
                            ),
                            controller: genderController,
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
                          SizedBox(height: 10.0,),
                          ButtonTheme(
                            minWidth: 300.0,
                            child: RaisedButton(
                              onPressed: () async{
                                Map<String,dynamic> data = await userObject.register(emailController.text,passwordController.text,nameController.text,genderController.text,int.parse(ageController.text));
                                if (data["success"] == true) {
                                    Navigator.pushNamed(context, '/login');
                                } else {
                                  // refresh login screen
                                }
                              },
                              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                              
                              child: Text(
                                'Register',
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