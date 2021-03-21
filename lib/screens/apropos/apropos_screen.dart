import 'package:IrisApps/constants.dart';
import 'package:IrisApps/screens/apropos/termes_utilisation_screen.dart';
import 'package:IrisApps/screens/settings/language_screen.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class AproposScreen extends StatefulWidget {
  @override
  _AproposScreenState createState() => _AproposScreenState();
}

class _AproposScreenState extends State<AproposScreen> {
  bool envoieNotifParEmail = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(aproposTitle)),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Mentions Legales',
            tiles: [
              SettingsTile(
                title: 'Termes d\'utilisation',
                leading: Icon(Icons.book),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          TermesUtilisationScreen()));
                },
              ),
              SettingsTile(
                title: 'Licences',
                leading: Icon(Icons.book),
                onTap: afficherLicense,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> afficherLicense() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Licences MoCars'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('MoCars'),
                Text('Version 1.0.0'),
                Text('Tous droits résérvés'),
              ],
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              child: Text('Fermer'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
