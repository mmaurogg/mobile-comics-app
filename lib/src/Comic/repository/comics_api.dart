import 'package:comic_app/src/Comic/model/models.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

import 'package:comic_app/src/Comic/model/comic.dart';

class ComicsAPI {
  final String _baseUrl = 'gateway.marvel.com';
  final String _endPoint = 'v1/public/comics';
  String ts = '1';
  String apiKey = 'd9aea301510df01e0a3ef3b23bf280d1';
  String privateKey = 'ddf63bc04df37facf75bd99713d19954b01b3211';
  int _curretpage = 0;

  ComicsAPI() {
  }

  Future getComics() async {
    var hash = md5
        .convert(
        utf8.encode(ts) + utf8.encode(privateKey) + utf8.encode(apiKey))
        .toString();

    final url = Uri.https(_baseUrl, _endPoint, {
      'ts': ts,
      'apikey': apiKey,
      'hash': hash,
      'offset': _curretpage.toString()
    });

    final resp = await http.get(url);
    final comicResponse = WarpComicResponse.fromJson(resp.body);

    //notifyListeners();
    return comicResponse.data.results;
  }
}
