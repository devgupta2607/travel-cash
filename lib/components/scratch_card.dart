import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

class Scratch extends StatefulWidget {
  @override
  _ScratchState createState() => _ScratchState();
}

class _ScratchState extends State<Scratch> {
  double progress = 0;
  final key = GlobalKey<ScratcherState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  child: Scratcher(
                    key: key,
                    brushSize: 30,
                    threshold: 30,
                    color: Colors.red,
                    onChange: (value) {},
                    child: Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'You won 20 points',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13, color: Colors.amber),
                            ),
                          ],
                        ),
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
                ),
                RaisedButton(
                  child: const Text('Reset'),
                  onPressed: () {
                    key.currentState.reset(duration: Duration(milliseconds: 2000));
                  },
                ),
                RaisedButton(
                  child: const Text('Reveal'),
                  onPressed: () {
                    key.currentState.reveal(duration: Duration(milliseconds: 2000));
                  },
                ),
            ],
          ),
    );
  }
}

//child: RaisedButton(
//            child: const Text('Reset'),
//           onPressed: () {
//              key.currentState.reset(duration: Duration(milliseconds: 2000));
//            },
//          ),

// child: RaisedButton(
          //   child: const Text('Reveal'),
          //   onPressed: () {
          //     key.currentState.reveal(duration: Duration(milliseconds: 2000));
          //   },
          // ),