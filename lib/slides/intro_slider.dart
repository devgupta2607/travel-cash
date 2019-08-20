import 'package:flutter/material.dart';

import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:travel_cash/slides/homescreen.dart';
import 'package:travel_cash/components/card.dart';
import 'package:travel_cash/components/googy.dart';

class Introapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  Function goToTab;

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "TRAVEL CASH",
        styleTitle: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Earn Cash while travelling everyday with public transport",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Raleway'),
        pathImage: "images/logo.png",
      ),
    );
    slides.add(
      new Slide(
        title: "SIMPLE WAY TO EARN CASH",
        styleTitle: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Just Scan the QR code available on your public mode of transport to start your journey and end journey by scanning the last transport QR code",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Raleway'),
        pathImage: "images/logo.png",
      ),
    );
    slides.add(
      new Slide(
        title: "OFFERS",
        styleTitle: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Use the cash earned to get exciting offers around your most visited places",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Raleway'),
        pathImage: "images/logo.png",
      ),
    );
  }

  void onDonePress() {
    // Back to the first tab
    Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffffcc5c),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffffcc5c),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffffcc5c),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        color: Colors.transparent,
        width: double.infinity,
        height: double.infinity,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              SizedBox(height: 20.0,),
              TCard(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset(
                      currentSlide.pathImage,
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.contain,
                    )),
                    Container(
                      child: Text(
                        currentSlide.description,
                        style: currentSlide.styleDescription,
                        textAlign: TextAlign.center,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Color(0xFF351C75),
      child: Stack(
        children: <Widget>[
          new Background(),
          new IntroSlider(
            // List slides
            slides: this.slides,

            // Skip button
            renderSkipBtn: this.renderSkipBtn(),
            colorSkipBtn: Color(0x33ffcc5c),
            highlightColorSkipBtn: Color(0xFF351C75),

            // Next button
            renderNextBtn: this.renderNextBtn(),

            // Done button
            renderDoneBtn: this.renderDoneBtn(),
            onDonePress: this.onDonePress,
            colorDoneBtn: Color(0x33ffcc5c),
            highlightColorDoneBtn: Color(0xFF351C75),

            // Dot indicator
            colorDot: Color(0x33ffcc5c),
            sizeDot: 13.0,
            typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

            // Tabs
            listCustomTabs: this.renderListCustomTabs(),
            backgroundColorAllSlides: Colors.transparent,
            refFuncGoToTab: (refFunc) {
              this.goToTab = refFunc;
            },

            // Show or hide status bar
            shouldHideStatusBar: true,

            // On tab change completed
            onTabChangeCompleted: this.onTabChangeCompleted,
          ),
        ],
    )
    
    );
  }
}
