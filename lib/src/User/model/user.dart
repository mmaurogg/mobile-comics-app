import 'package:flutter/material.dart';
import 'package:comic_app/src/Comic/model/models.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  final List<ComicModel>? myFavoriteComics  = [];

  UserModel(
      {Key? key,
        required this.uid,
        required this.name,
        required this.photoURL,
        required this.email,
      });


}
