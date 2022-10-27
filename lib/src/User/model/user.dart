import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:comic_app/src/Comic/model/models.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  List<ComicModel>? myFavoriteComics;

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

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
        photoURL: json["photoURL"],
        myFavoriteComics: List<ComicModel>.from(json["myFavoriteComics"].map((x) => ComicModel.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "uid": uid,
    "name": name,
    "email": email,
    "photoURL": photoURL,
    "myFavoriteComics": List<dynamic>.from(myFavoriteComics!.map((x) => x.toMap()))
  };

  get favoriteComics {
    return myFavoriteComics;
  }


  addFavorite(ComicModel comic){

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
      if (!idComic.contains(comic.id.toString())) {
        tempFavorites.add(comic);
      }
    }
    myFavoriteComics = tempFavorites;
    return myFavoriteComics;
  }



}
