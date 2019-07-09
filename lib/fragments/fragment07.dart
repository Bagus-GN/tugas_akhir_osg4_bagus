import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(Fragment07());

class Fragment07 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Opacity Demo';
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Whether the green box should be visible
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showMyDialog(context));

    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          // If the widget is visible, animate to 0.0 (invisible).
          // If the widget is hidden, animate to 1.0 (fully visible).
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          // The green box must be a child of the AnimatedOpacity widget.

          child: Container(
            child: Hero(
                tag: 'hero1',
                child: CustomLogo(
                  size: 300.0,
                )),
          ),
        ),
      ),
    );
  }
}

showMyDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: Hero(
              tag: "hero2",
              child: Material(
                  child: Text(
                      'Tugas Akhir Eudeka Flutter OSG 4 \n oleh Bagus Ganang Nugroho'))),
          content: Container(
            child: Hero(
                tag: 'hero1',
                child: CustomLogo(
                  size: 300.0,
                )),
          ),
          actions: <Widget>[
            OutlineButton(
              onPressed: () => Navigator.of(context).pop(),
              color: Colors.red,
              child: Icon(Icons.close),
            ),
          ],
        );
      });
}

class CustomLogo extends StatelessWidget {
  final double size;

  CustomLogo({this.size = 200.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      width: size,
      height: size,
      child: Center(
        child: Image.asset(
          "images/bagus_profile.png",
          width: size,
          height: size,
        ),
      ),
    );
  }
}
