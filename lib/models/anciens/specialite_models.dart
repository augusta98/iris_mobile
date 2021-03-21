import 'package:IrisApps/models/anciens/mecanicien_models.dart';

class Specialite {
  String imageUrl;
  String nomSpecialite;
  String description;
  List<Mecanicien> mecaniciens;

  Specialite(
      {this.imageUrl, this.nomSpecialite, this.description, this.mecaniciens});
}

List<Specialite> nosSpecialite = [
  Specialite(
    imageUrl: 'https://i.ibb.co/54Qm61J/venice.jpg',
    nomSpecialite: 'Pneu',
    description: 'Reparation des pneus',
    mecaniciens: mecaniciens,
  ),
  Specialite(
    imageUrl: 'https://i.ibb.co/54Qm61J/venice.jpg',
    nomSpecialite: 'Moteur',
    description: 'Reparation de moteur',
    mecaniciens: mecaniciens,
  ),
  Specialite(
    imageUrl: 'https://i.ibb.co/54Qm61J/venice.jpg',
    nomSpecialite: 'Piece de rechange',
    description: 'Magasin de pieces de rechanges',
    mecaniciens: mecaniciens,
  ),
  Specialite(
    imageUrl: 'https://i.ibb.co/54Qm61J/venice.jpg',
    nomSpecialite: 'Carosserie',
    description: 'Reparation de carosseries',
    mecaniciens: mecaniciens,
  ),
];
