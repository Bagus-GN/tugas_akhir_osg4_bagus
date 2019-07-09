import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:tugas_akhir_osg4_bagus/pages/card_detail.dart';
import 'package:tugas_akhir_osg4_bagus/pages/card_item.dart';
import 'package:tugas_akhir_osg4_bagus/utils/httpConn.dart';
import 'package:tugas_akhir_osg4_bagus/utils/cardModel.dart';

class Fragment04 extends StatelessWidget {
  final String title;

  const Fragment04 ({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HttpConn jsonConn = HttpConn('https://db.ygoprodeck.com/api/v5/cardinfo.php?num=35&fname=Abyss');
    return new Container(
      child: FutureBuilder(
        future: jsonConn.getCards(),
        builder: (context, snapshot) {
          List<Widget> _fetchData() {
            return (snapshot.data as List<Cards>).map((data) {
              return CardItem(
                name: data.name,
                desc: data.desc,
                image_url: data.cardImages[0].imageUrlSmall,
                onTap: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(data.name + " detail"),
                  ));
                  new Timer(Duration(milliseconds: 300), () {
                    Navigator.of(context)
                        .push(new MaterialPageRoute(builder: (context) {
                      return DetailScreen(card: data);
                    }));
                  });
                },
              );
            }).toList();
          }

          return ListView(
            children: <Widget>[
              if (snapshot.hasData)
                ..._fetchData()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          );
        },
      ),
    ); //container
  }
}
