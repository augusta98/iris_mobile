import 'package:IrisApps/data/database-helper.dart';
import 'package:IrisApps/models/anciens/mecanicien_models.dart';
import 'package:flutter/material.dart';

class CommonFunction {
  static Text buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars = stars + '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  static List<Mecanicien> getList() {
    var db = new DatabaseHelper();
    List<Mecanicien> professeurList;
    db.getlistMecanicien().then((value) => professeurList = value);
    print("Liste: $professeurList");
    return professeurList;
  }
}
