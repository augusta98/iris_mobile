import 'package:collection/collection.dart';

class Mecanicien {
  String imageUrl;
  String nommecanicien;
  String prenommecanicien;
  String phone;
  String ville;
  String specialite;
  String heureOuverture;
  String heureFermeture;
  int rating;
  int price;

  Mecanicien(
      {this.heureFermeture,
      this.heureOuverture,
      this.imageUrl,
      this.nommecanicien,
      this.phone,
      this.prenommecanicien,
      this.price,
      this.rating,
      this.specialite,
      this.ville});

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["heureFermeture"] = heureFermeture;
    map["heureOuverture"] = heureOuverture;
    map["imageUrl"] = imageUrl;
    map["nommecanicien"] = nommecanicien;
    map["phone"] = phone;
    map["prenommecanicien"] = prenommecanicien;
    map["price"] = price;
    map["rating"] = rating;
    map["specialite"] = specialite;
    map["ville"] = ville;
    return map;
  }

  Mecanicien.fromMap(Map<String, dynamic> map) {
    this.heureFermeture = map["heureFermeture"];
    this.heureOuverture = map["heureOuverture"];
    this.imageUrl = map["imageUrl"];
    this.nommecanicien = map["nommecanicien"];
    this.phone = map["phone"];
    this.prenommecanicien = map["prenommecanicien"];
    this.price = map["price"];
    this.rating = map["rating"];
    this.specialite = map["specialite"];
    this.ville = map["ville"];
  }
}

List<Mecanicien> mecaniciens = [
  Mecanicien(
      nommecanicien: "jean du pont",
      prenommecanicien: "luc",
      heureFermeture: "09:00 a.m",
      heureOuverture: "05:00 a.m",
      imageUrl: "https://i.ibb.co/54Qm61J/venice.jpg",
      phone: "54762",
      price: 1200,
      rating: 4,
      specialite: "Pneu",
      ville: "Rose Hill"),
  Mecanicien(
      nommecanicien: "des champs",
      prenommecanicien: "Sik",
      heureFermeture: "09:00 a.m",
      heureOuverture: "05:00 a.m",
      imageUrl: "https://i.ibb.co/54Qm61J/venice.jpg",
      phone: "54762",
      price: 1200,
      rating: 4,
      specialite: "Pneu",
      ville: "Curepipe"),
  Mecanicien(
      nommecanicien: "elite",
      prenommecanicien: "zaire",
      heureFermeture: "09:00 a.m",
      heureOuverture: "05:00 a.m",
      imageUrl: "https://i.ibb.co/54Qm61J/venice.jpg",
      phone: "54762",
      price: 1200,
      rating: 4,
      specialite: "Moteur",
      ville: "Moka")
];

var mecanicienParSpecialite = groupBy(mecaniciens, (obj) => obj.specialite);
