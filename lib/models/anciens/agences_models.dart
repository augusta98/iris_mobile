import 'activity_models.dart';

class Agences {
  String imageUrl;
  String adresse;
  String description;
  String ville;
  String nom;
  List<Activity> activities;

  Agences(
      {this.imageUrl,
      this.adresse,
      this.ville,
      this.nom,
      this.description,
      this.activities});
}

List<Activity> activities = [
  Activity(
    imageUrl: 'https://i.ibb.co/HBWR2Ph/check.jpg',
    name: 'Rose hill',
    type: 'Tour',
    starTimes: ['10:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'https://i.ibb.co/HBWR2Ph/check.jpg',
    name: 'Rose hill',
    type: 'Tour',
    starTimes: ['10:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'https://i.ibb.co/HBWR2Ph/check.jpg',
    name: 'Rose hill',
    type: 'Tour',
    starTimes: ['10:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'https://i.ibb.co/HBWR2Ph/check.jpg',
    name: 'Rose hill',
    type: 'Tour',
    starTimes: ['10:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
];

List<Agences> agencesList = [
  Agences(
    imageUrl: 'https://i.ibb.co/HBWR2Ph/check.jpg',
    ville: 'rose hill',
    nom: 'Swan Ltd',
    description: 'il bouge bien',
    adresse: '11 Rue ABC',
    activities: activities,
  ),
  Agences(
    imageUrl: 'https://i.ibb.co/Njj3gD5/solo.jpg',
    ville: 'rose hill',
    description: 'consulter nous, vous ne serez pas decu',
    adresse: '11 Rue ABC',
    nom: 'Eagle Insurance Ltd',
    activities: activities,
  ),
  Agences(
    imageUrl: 'https://i.ibb.co/HBWR2Ph/check.jpg',
    ville: 'rose hill',
    description: 'il bouge bien',
    adresse: '11 Rue ABC',
    nom: 'MUA',
    activities: activities,
  ),
  Agences(
    imageUrl: 'https://i.ibb.co/HBWR2Ph/check.jpg',
    ville: 'rose hill',
    description: 'il bouge bien',
    adresse: '11 Rue ABC',
    nom: 'MoCar Agence',
    activities: activities,
  ),
];
