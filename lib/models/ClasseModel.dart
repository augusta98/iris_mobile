import 'package:IrisApps/models/CoursModel.dart';
import 'package:IrisApps/models/departementModel.dart';

class ClasseResponse {
  int totalResults;
  List<Classe> results;

  ClasseResponse({this.totalResults, this.results});

  ClasseResponse.fromJson(dynamic json) {
    if (json != null) {
      results = new List<Classe>();
      json.forEach((v) {
        results.add(new Classe.fromJson(v));
      });
    }
  }
}

class Classe {
  int id;
  var anneeScolaire;
  String descriptionClasse;
  Departement departement;
  List<Cours> listCours;

  Classe({
    this.id,
    this.anneeScolaire,
    this.descriptionClasse,
    this.departement,
    this.listCours,
  });
  Classe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    anneeScolaire = json['anneeScolaire'];
    descriptionClasse = json['DescriptionClasse'];
    departement = new Departement.fromJson(json['departement']);
    listCours = getListCours(json['listecours']);
  }

  getListCours(dynamic json) {
    List<Cours> reponse = new List<Cours>();
    if (json != null) {
      json.forEach((v) {
        reponse.add(new Cours.fromJson(v));
      });
    }
    return reponse;
  }
}
