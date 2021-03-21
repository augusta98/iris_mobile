import 'package:IrisApps/models/SequenceModel.dart';

class CoursResponse {
  int totalResults;
  List<Cours> results;

  CoursResponse({this.totalResults, this.results});

  CoursResponse.fromJson(dynamic json) {
    if (json != null) {
      results = new List<Cours>();
      json.forEach((v) {
        results.add(new Cours.fromJson(v));
      });
    }
  }
}

class Cours {
  int id;
  String nomCours;
  String descriptionCours;
  String nbreHeures;
  String professeur;
  List<Sequence> listeSequence;

  Cours(
      {this.id,
      this.nomCours,
      this.descriptionCours,
      this.nbreHeures,
      this.professeur,
      this.listeSequence});
  Cours.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomCours = json['nomCours'];
    descriptionCours = json['descriptionCours'];
    nbreHeures = json['nbreHeures'];
    professeur = json['professeur'];
    listeSequence = getListeSequence(json['listeSequence']);
  }

  getListeSequence(dynamic json) {
    List<Sequence> reponse = new List<Sequence>();
    if (json != null) {
      json.forEach((v) {
        reponse.add(new Sequence.fromJson(v));
      });
    }
    return reponse;
  }
}
