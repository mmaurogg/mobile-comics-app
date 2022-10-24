import 'package:comic_app/src/Comic/repository/comic_repository.dart';
import 'package:flutter/material.dart';

import '../model/models.dart';

class ComicBloc extends ChangeNotifier {

  final _comicRepository = ComicRepository();

   List<ComicModel> comics = [];

  ComicBloc(){
    loadComics();
  }
  //Casos de uso

  //1. Obtener todos los comics de la API
  Future<List<ComicModel>> loadComics() async {

    print('hola loadComics');

    _comicRepository.getComics()
        .then((comicsResponse) {
          comics = comicsResponse;
          notifyListeners();
    });

    return comics;
  }

  //2. Listar siguientes 20 resultados
  loadNextComics() {
    print('hola loadNextComics');
    _comicRepository.getNextComics()
        .then((comicsResponse) {
          comics.addAll(comicsResponse);
          notifyListeners();
        });
  }


}