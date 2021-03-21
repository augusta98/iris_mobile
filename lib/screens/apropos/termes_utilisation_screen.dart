import 'package:IrisApps/constants.dart';
import 'package:flutter/material.dart';

class TermesUtilisationScreen extends StatefulWidget {
  @override
  _TermesUtilisationScreenState createState() =>
      _TermesUtilisationScreenState();
}

class _TermesUtilisationScreenState extends State<TermesUtilisationScreen> {
  bool envoieNotifParEmail = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Termes d\'utilisations')),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: ListBody(
          children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              'Termes d\'utilisation',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
                'MoCars est une application pour tout les besoins en rapport avec votre voiture.',
                style: TextStyle(letterSpacing: 1.2)),
            SizedBox(height: 20.0),
            Text(
              'Les présentes CGU ou Conditions Générales d’Utilisation encadrent juridiquement l’utilisation des services du site lapetiteperle (ci-après dénommé « le site »).Constituant le contrat entre la société La Petite Perle, l’Utilisateur, l’accès au site doit être précédé de l’acceptation de ces CGU. L’accès à cette plateforme signifie l’acceptation des présentes CGU.',
              style: TextStyle(letterSpacing: 1.2),
            ),
            SizedBox(height: 20.0),
            Text(
              'Pour la création du compte de l’Utilisateur, la collecte des informations au moment de l’inscription sur le site est nécessaire et obligatoire. Conformément à la loi n°78-17 du 6 janvier relative à l’informatique, aux fichiers et aux libertés, la collecte et le traitement d’informations personnelles s’effectuent dans le respect de la vie privée. Suivant la loi Informatique et Libertés en date du 6 janvier 1978, articles 39 et 40, l’Utilisateur dispose du droit d’accéder, de rectifier, de supprimer et d’opposer ses données personnelles',
              style: TextStyle(letterSpacing: 1.2),
            ),
          ],
        ),
      ),
    );
  }
}
