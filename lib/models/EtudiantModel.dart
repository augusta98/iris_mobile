import 'package:IrisApps/models/departementModel.dart';

class Etudiant {
  int id;
  String nomEtudiant;
  String prenomEtudiant;
  String identifiantUnique;

  Etudiant({
    this.id,
    this.nomEtudiant,
    this.prenomEtudiant,
    this.identifiantUnique,
  });
  Etudiant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomEtudiant = json['nomEtudiant'];
    prenomEtudiant = json['prenomEtudiant'];
    identifiantUnique = json['identidiantUnique'];
  }
}
