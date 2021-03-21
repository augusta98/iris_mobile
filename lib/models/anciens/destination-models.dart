//import 'package:flutter_travel/models/activity_models.dart';

import 'activity_models.dart';

class Destination {
  String imageUrl;
  String ville;
  String description;
  List<Activity> activities;

  Destination({
    this.imageUrl,
    this.ville,
    this.activities,
    this.description,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: 'https://i.ibb.co/HBWR2Ph/check.jpg',
    name: 'Rose hill',
    type: 'Tour',
    startTimes: ['10:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'https://i.ibb.co/HBWR2Ph/check.jpg',
    name: 'Rose hill Plaines Wilhems O Nord De Maurice',
    type: 'Tour',
    startTimes: ['10:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'https://i.ibb.co/HBWR2Ph/check.jpg',
    name: 'Rose hill',
    type: 'Tour',
    startTimes: ['10:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'https://i.ibb.co/HBWR2Ph/check.jpg',
    name: 'Rose hill',
    type: 'Tour',
    startTimes: ['10:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
];

List<Destination> destinationList = [
  Destination(
    imageUrl: 'https://i.ibb.co/54Qm61J/venice.jpg',
    ville: 'rose hill',
    description: 'il bouge bien',
    activities: activities,
  ),
  Destination(
    imageUrl: 'https://i.ibb.co/Njj3gD5/solo.jpg',
    ville: 'rose hill',
    description: 'consulter nous, vous ne serez pas decu',
    activities: activities,
  ),
  Destination(
    imageUrl: 'https://i.ibb.co/HBWR2Ph/check.jpg',
    ville: 'rose hill',
    description: 'il bouge bien',
    activities: activities,
  ),
  Destination(
    imageUrl: 'https://i.ibb.co/HBWR2Ph/check.jpg',
    ville: 'rose hill',
    description: 'il bouge bien',
    activities: activities,
  ),
];
