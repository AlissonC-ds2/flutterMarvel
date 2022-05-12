import 'dart:convert';
import 'package:crypto/crypto.dart' as crypto;
import 'package:convert/convert.dart';
import 'package:http/http.dart' as http;
import 'package:marvel/model/models.dart';

class RepositoryMarvel {
  String searchSuperHero = '';
  String apikey = "d0d5b2e4980471f135607ed08ae66dbb6c5c0729";
  String apiPublica = "32f207ac4e73f73b296d0e9b4b8dc49b";
  int _offset = 0;
  int limit = 20;
  String nameHero = '';
  String descriptionHero = '';

  Future<Data> getHeroes() async {
    http.Response response;
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    String temp = "$timestamp$apikey$apiPublica";
    String hash = generateMd5(temp);

    final uri = Uri.parse("https://gateway.marvel.com:443/v1/public/characters?ts=$timestamp&apikey=32f207ac4e73f73b296d0e9b4b8dc49b&hash=$hash");

    response = await http.get(uri);
      
    return Data.fromJson(json.decode(response.body));

  }

  Future<Data> getHeroesByName(String param) async {
    http.Response response;
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    String temp = "$timestamp$apikey$apiPublica";
    String hash = generateMd5(temp);

    final uri = Uri.parse("https://gateway.marvel.com:443/v1/public/characters?nameStartsWith=$param&ts=$timestamp&apikey=32f207ac4e73f73b296d0e9b4b8dc49b&hash=$hash");

    response = await http.get(uri);
      
    return Data.fromJson(json.decode(response.body));

  }



  generateMd5(String data) {
    var content =  Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }



}



