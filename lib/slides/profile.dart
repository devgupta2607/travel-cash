import 'package:flutter/material.dart';
import '../util/user.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainProfile(),
    );
  }
}

class MainProfile extends StatefulWidget {
  @override
  _MainProfileState createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    

    return FutureBuilder<Map<String, dynamic>>(
      future: userObject.status(),
      builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Text("Creating account", 
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto-Thin',
                        ),
                      ),
                    )
                ],
              ),
            )
          );
        }

        return Scaffold(
      body: SafeArea(
              child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Text(
                'Hi! ${snapshot.data["user"]["name"]}',
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Roboto-Light',
                  
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade700,
                    borderRadius: new BorderRadius.circular(20),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10.0,
                        offset: Offset(0, 1)
                      )
                    ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Wallet',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: 'Roboto-Light',
                          ),
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset(
                            'images/logo.png',
                            width: 50.0,
                            height: 50.0,
                          ),
                          Text(
                            '50',
                            style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 15.0,
                          ),
                          )
                      ],)
                    ],
                  ),
                ),
                Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade700,
                    borderRadius: new BorderRadius.circular(20),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10.0,
                        offset: Offset(0, 1)
                      )
                    ]
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Your Coupons',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15.0,
                          ),
                      ),
                      Text(
                        '5',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 15.0,
                      ),
                      )
                    ],
                  ),
                ),
              ],
              )
          ],
          ),
      )
    );
      }
    );
  }
}