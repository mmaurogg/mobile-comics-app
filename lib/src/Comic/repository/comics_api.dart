import 'package:comic_app/src/Comic/model/models.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;


class ComicsAPI {
  final String _baseUrl = 'gateway.marvel.com';
  final String _endPoint = 'v1/public/comics';
  String ts = '1';
  String apiKey = 'd9aea301510df01e0a3ef3b23bf280d1';
  String privateKey = 'ddf63bc04df37facf75bd99713d19954b01b3211';
  int _currentpage = 0;

  ComicsAPI() {
  }

  Future <String> _getJsonData(String endPoint, [int page = 0]) async {
    var hash = md5
        .convert(
        utf8.encode(ts) + utf8.encode(privateKey) + utf8.encode(apiKey))
        .toString();
    final url = Uri.https(_baseUrl, endPoint, {
      'ts': ts,
      'apikey': apiKey,
      'hash': hash,
      'offset': page.toString()
    });
    final resp = await http.get(url);
    return resp.body;
  }

  Future getComics() async {
    final jsonData = await _getJsonData(_endPoint, _currentpage);
    final comicResponse = WarpComicResponse.fromJson(jsonData);
    return comicResponse.data.results;
  }

  getNextComics() async {
    _currentpage ++;
    final jsonData = await _getJsonData(_endPoint, _currentpage);
    final nextComicsResponse = WarpComicResponse.fromJson(jsonData);

    return nextComicsResponse.data.results;
  }




}
