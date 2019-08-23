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
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Scaffold(
      body: SafeArea(
              child: Column(
          children: <Widget>[
            Text(
              'Hi! ${snapshot.data["user"]["name"]}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(20),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black38,
                        blurRadius: 20.0,
                        offset: Offset(0, 10)
                      )
                    ]
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Your Wallet',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15.0,
                          ),
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset(
                            'images/logo.png',
                            width: 10.0,
                            height: 8.0,
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
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(20),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black38,
                        blurRadius: 20.0,
                        offset: Offset(0, 10)
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