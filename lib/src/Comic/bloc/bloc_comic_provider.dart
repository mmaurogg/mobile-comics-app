import 'package:comic_app/src/Comic/repository/comic_repository.dart';
import 'package:flutter/material.dart';

import '../model/models.dart';

class ComicBloc extends ChangeNotifier {

  final _comicRepository = ComicRepository();

   List<ComicModel> comics = [];


  ComicBloc(){
    this.loadComics();
  }
  //Casos de uso

  //1. Obtener todos los comics de la API
  Future<List<ComicModel>> loadComics() async {
    _comicRepository.getComics()
        .then((comicsResponse) {
          comics = comicsResponse;
          notifyListeners();
    });

    return comics;
  }


}