import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import '../components/googy.dart';
class HomeScreen extends StatelessWidget {
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
        body: Stack(
          children: <Widget>[
            Background(),
            Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 402,
                decoration: BoxDecoration(border: Border.all( color: Colors.white)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Center(
                      child: Container(child: Logo(), height: 250),
                    ),
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.black38,
                            blurRadius: 20.0,
                            offset: Offset(0, 10)
                          ),
                        ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Travel Cash',
                              style: TextStyle(
                              fontFamily: 'Pacifico',
                              fontSize: 30.0,
                            ),
                          ),
                          Text(
                            'Login to start earning!',
                              style: TextStyle(
                              fontFamily: 'Roboto Thin',
                              fontSize: 20.0,
                            ),
                          ),
                      ],
                    ),
                    ),
                  ],
                ),
              ),
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
          ],
        )
        );
  }
}




class Logo extends StatefulWidget {
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
    final Animation curve = CurvedAnimation(parent: controller, curve: Curves.easeInOutExpo);
    animation = Tween<double>(begin: -300, end: 0.0).animate(curve)
    ..addListener(() {
      setState(() {

      });
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('images/logo.png',),
      width: MediaQuery.of(context).size.width,
      transform: Matrix4.translationValues(animation.value, 0, 0),
      constraints: BoxConstraints(maxWidth: 200),
    );
  }

  @override            
  void dispose() {            
    controller.dispose();            
    super.dispose();            
  }
}