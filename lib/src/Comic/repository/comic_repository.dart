import 'package:comic_app/src/Comic/repository/comics_api.dart';
import 'package:flutter/material.dart';

class ComicRepository {

  final _comicAPI = ComicsAPI();

  Future<dynamic> getComics() async => await _comicAPI.getComics();

  getNextComics() => _comicAPI.getNextComics();


}