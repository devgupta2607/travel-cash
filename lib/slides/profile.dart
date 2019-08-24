import 'package:flutter/material.dart';
import '../util/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './homescreen.dart';
import 'main_map.dart';

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
  bool showBottom = false;
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
                      child: Text("Setting up account", 
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
      
      Widget historyWidget;
      final List<dynamic> history = snapshot.data["user"]["history"];
      if (history.length == 0){
         historyWidget = Container(
           width: double.infinity,
           height: 350.0,
          margin: EdgeInsets.symmetric(horizontal: .0),
           child: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Text('No history available.',
                  style: TextStyle(
                 fontFamily: 'Roboto-Light',
                 fontSize: 20.0,
                 ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Click on the below button to start your journey',
                  style: TextStyle(
                    fontFamily: 'Roboto-Light',
                    color: Colors.grey.shade700,
                  ),
                )
               ],
             ),
           ),
         );
      } else {

        historyWidget = Expanded(
          child: ListView.builder(
            itemCount: history.length + 1,
              itemBuilder: (BuildContext ctxt, int index) {
                if (index == history.length){
                  return CircularProgressIndicator();
                }
                return Container(
                  height: 400.0,
                  child: ListTile(
                      title: Text('${history[index]["start"]} to ${history[index]["end"]}'),
                      trailing: Text('Cash earned: ${history[index]["cash"]}'),
                  ),
                );
              },
          ),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'images/tc_logo.png',
                              width: 30.0,
                              height: 30.0,
                            ),
                            SizedBox(width: 10.0,),
                            Text(
                              '${snapshot.data["user"]["cash"]}',
                              style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 15.0,
                            ),
                            )
                        ],),
                      )
                    ],
                  ),
                ),
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
                        'Coupons',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: 'Roboto-Light',
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '5',
                              style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 15.0,
                            ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
              ),
              SizedBox(height: 10.0),
              Text('Travel History',
              style: TextStyle(
                fontFamily: 'Roboto-Thin',
                fontWeight: FontWeight.w200,
                fontSize: 30.0,
                ),
              ),
              historyWidget,
          ],
          ),
      ),
      bottomNavigationBar: Builder(
        builder: (cxt){
          return BottomAppBar(
        
            color: Colors.white,
            elevation: 5.0,
            shape: AutomaticNotchedShape(
            RoundedRectangleBorder(),
            StadiumBorder(side: BorderSide())
            ),
    
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
        SizedBox(height:50.0),
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
                showBottomSheet(
                  context: cxt,
                  builder: (context) => Container(
                    color: Colors.white,
                    height: showBottom?100.0: 0.0,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 50.0),
                        Container(
                          height: 40.0,
                          child: OutlineButton(onPressed: (){
                            userObject.logout();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                          );
                          
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text('Logout',
                              style: TextStyle(fontFamily: 'Roboto-Light',
                    color: Colors.grey.shade700,)),),
                          
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                showBottom = !showBottom;
  
              
          },
        )
        ],
        ),
    ),
      );
        },
      ),
      
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainMap(),
            ),
        );
        },
        label: Text('Start Journey'),
        icon: Icon(FontAwesomeIcons.locationArrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
    );
      }
    );
  }
}