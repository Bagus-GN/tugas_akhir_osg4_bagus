import 'dart:convert';
import 'package:tugas_akhir_osg4_bagus/utils/cardModel.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class HttpConn {

  final String UrlString;

  HttpConn(this.UrlString);


  Future<List<Cards>> getCards() async {
//    final response = await http.get("https://db.ygoprodeck.com/api/v5/cardinfo.php?num=20");
    final response = await http.get(UrlString);

//    final response =
//        await http.get("http://192.168.23.1/datajson/cardinfo250.json");

    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      return (result as List).map((data) => Cards.fromJson(data)).toList();
    } else {
      throw Exception("Cannot load cards");
    }
  }
}
