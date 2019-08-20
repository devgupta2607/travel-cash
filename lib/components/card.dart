import 'package:flutter/material.dart';

class TCard extends StatefulWidget {
  final Widget child; 
  TCard({Key key, @required this.child }) : super(key: key);
  @override
  _TCardState createState() => _TCardState();
}

class _TCardState extends State<TCard> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          width: MediaQuery.of(context).size.width*0.8,
          child: Padding(
            padding: EdgeInsets.all(10.0) ,
            child: widget.child
          ),
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
        ),
    );
  }
}
  
