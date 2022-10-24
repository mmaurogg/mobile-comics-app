import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:comic_app/src/Comic/model/models.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  List<dynamic>? myFavoriteComics;

  UserModel(
      {Key? key,
        required this.uid,
        required this.name,
        required this.photoURL,
        required this.email,
        this.myFavoriteComics,
      });

  factory UserModel.fromJson(String str) =>
      UserModel.fromMap(json.decode(str));

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
        photoURL: json["photoURL"],
        myFavoriteComics: List<ComicModel>.from(json["myFavoriteComics"].map((x) => ComicModel.fromMap(x))),
  );



  addFavorite(ComicModel comic){
    if( myFavoriteComics == null){
      myFavoriteComics = [];
    }

    if (myFavoriteComics!.contains(comic)){
      return myFavoriteComics;
    } else {
      myFavoriteComics!.add(comic);
      return myFavoriteComics;
    }
  }

  deleteFavorite(String idComic){

    List<ComicModel> tempFavorites = [];

    for (var comic in myFavoriteComics!) {
      if (idComic != comic.id) {
        tempFavorites.add(comic);
      }
    }

    myFavoriteComics = tempFavorites;

    return myFavoriteComics;
  }



}
