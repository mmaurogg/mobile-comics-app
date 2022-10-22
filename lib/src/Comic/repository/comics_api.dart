import 'dart:convert';

import 'package:comic_app/src/Comic/model/comic.dart';
import 'package:crypto/crypto.dart';

import 'package:http/http.dart' as http;


class ComicsAPI{

  String _baseUrl = 'gateway.marvel.com';
  String ts = DateTime.now().toString();
  String apiKey = 'd9aea301510df01e0a3ef3b23bf280d1';
  String privateKey = 'ddf63bc04df37facf75bd99713d19954b01b3211';

  final List<ComicModel> comics = [];


  
  //Uri.parse('$_baseUrl?ts=$ts&apikey=$apiKey&hash=$hash');

  Future loadComics() async {
    var hash = md5.convert(
        utf8.encode(ts) +
            utf8.encode(apiKey) +
            utf8.encode(privateKey)
    );

    final url = Uri.https(_baseUrl, 'v1/public/comics', {
      'ts': ts,
      'apikey': apiKey,
      'hash': hash
    });

    final resp = await http.get( url );
    final Map<String, dynamic> comicsMap = json.decode( resp.body );

    comicsMap.forEach((key, json) {
      final tempComic = ComicModel.fromMap(json);
      tempComic.id = resp as int;
      comics.add(tempComic);
    });

    return comics;

  }


}