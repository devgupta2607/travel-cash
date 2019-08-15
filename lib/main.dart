import 'package:flutter/material.dart';
import 'sign_in.dart';
import 'register.dart';
import 'qr_scanner.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/register": (BuildContext context) => Register(),
        "/login": (BuildContext context) => Login(),
        "/scan" : (BuildContext context) => QRcode(),
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
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 100.0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/scan");
                      },
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.white,
                      
                      child: Text(
                        'QR Code Scan',
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

class Background extends StatefulWidget {
  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    final Animation curve = CurvedAnimation(parent: controller, curve: Curves.linear);
    animation = Tween<double>(begin: 480.0, end: 500.0).animate(curve)
    ..addListener(() {
      setState(() {

      });
    });
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(child: Image.asset('images/back.png'), width: 500, height: 500*0.8, bottom: 80, left: MediaQuery.of(context).size.width/2 - 25),
        Positioned(child: Image.asset('images/back1.png'), width: animation.value, height: animation.value*0.8, bottom: 60, left: MediaQuery.of(context).size.width/2 - 20),
      ],
    );
  }

  @override            
  void dispose() {            
    controller.dispose();            
    super.dispose();            
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