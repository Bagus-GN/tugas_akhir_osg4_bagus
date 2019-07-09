import 'dart:async';
import 'package:flutter/material.dart';

class Fragment07 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Trial',
        home: Scaffold(
            appBar: AppBar(title: Text('About this application')),
            body: new MyHome()));
  }
}

class MyHome extends StatelessWidget {
  // Wrapper Widget
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showMyDialog(context));
    return Container(
      child: Text("About this application"),
    );
  }

  showMyDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
        title: Hero(
            tag: "hero2", child: Material(child: Text('Tugas Akhir Eudeka Flutter OSG 4 \n oleh Bagus Ganang Nugroho'))),
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
        ],);
        });
  }
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
