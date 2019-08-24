import 'package:flutter/material.dart';

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
        Positioned(child: Image.asset('images/back1.png'), width: animation.value, height: animation.value*0.8, bottom: 60, left: MediaQuery.of(context).size.width/2 - 20),
        Positioned(child: Image.asset('images/back.png'), width: 500, height: 500*0.8, bottom: 80, left: MediaQuery.of(context).size.width/2 - 25),
      ],
    );
  }

  @override            
  void dispose() {            
    controller.dispose();            
    super.dispose();            
  }
}