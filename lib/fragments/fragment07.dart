import 'package:flutter/material.dart';
import '../dialogs/hero_dialog_route.dart';
import '../dialogs/page1.dart';
import '../dialogs/page2.dart';

class Fragment07 extends StatefulWidget {
  @override
  _Fragment07State createState() => _Fragment07State();
}

class _Fragment07State extends State<Fragment07> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
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
        ],
      ),
    );
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
