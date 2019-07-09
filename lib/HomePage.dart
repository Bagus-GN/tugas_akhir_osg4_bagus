import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'fragments/fragment01.dart';
import 'fragments/fragment02.dart';
import 'fragments/fragment03.dart';
import 'fragments/fragment04.dart';
import 'fragments/fragment05.dart';
import 'fragments/fragment06.dart';
import 'fragments/fragment07.dart';
//import 'hero_animations/main_hero_animations.dart';


class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new Fragment01();
      case 1:
        return new Fragment02();
      case 2:
        return new Fragment03();
      case 3:
        return new Fragment04();
      case 4:
        return new Fragment05();
      case 5:
        return new Fragment06();
      case 6:
        return new Fragment07();

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Kartu Yu Gi Oh!")),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Kartu Yu Gi Oh!"), accountEmail: null),
            new ListTile(
                leading: Icon(Icons.pages),
                title: new Text("Pengenalan"),
                onTap: () {
                  _onSelectItem(0);
                  _getDrawerItemWidget(0);
                }),
            new ListTile(
                leading: Icon(Icons.pages),
                title: new Text("Semua Kartu"),
                onTap: () {
                  _onSelectItem(1);
                  _getDrawerItemWidget(1);
                }),
            new ListTile(
                leading: Icon(Icons.pages),
                title: new Text("Kartu Monster"),
                onTap: () {
                  _onSelectItem(2);
                  _getDrawerItemWidget(2);
                }),
            new ListTile(
                leading: Icon(Icons.pages),
                title: new Text("Kartu Dewa Mesir"),
                onTap: () {
                  _onSelectItem(3);
                  _getDrawerItemWidget(3);
                }),
            new ListTile(
                leading: Icon(Icons.pages),
                title: new Text("Kartu Sihir"),
                onTap: () {
                  _onSelectItem(4);
                  _getDrawerItemWidget(4);
                }),
            new ListTile(
                leading: Icon(Icons.pages),
                title: new Text("Kartu Jebakan"),
                onTap: () {
                  _onSelectItem(5);
                  _getDrawerItemWidget(5);
                }),
            new Divider(),
            new ListTile(
                leading: Icon(Icons.info),
                title: new Text("Tentang Aplikasi"),
                onTap: () {
                  _onSelectItem(6);
                  _getDrawerItemWidget(6);
                }),
            new ListTile(
                leading: Icon(Icons.power_settings_new),
                title: new Text("Keluar"),
                onTap: () {
                  _showExitDialog();
                }),
          ],
        ),
      ),// drawer
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }

  void _showExitDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Apakah anda akan keluar dari aplikasi ?"),
          actions: <Widget>[
            FlatButton(
              child: Text("Ya"),
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
            FlatButton(
              child: Text("Tidak"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}