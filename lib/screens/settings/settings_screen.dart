import 'package:IrisApps/screens/authentification/forget_screen.dart';
import 'package:IrisApps/screens/authentification/login_screen.dart';

import 'package:IrisApps/screens/settings/language_screen.dart';

import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../constants.dart';

// import 'languages_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool envoieNotifParEmail = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(parametreTitle)),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Parametres application',
            tiles: [
              SettingsTile(
                title: 'Langues',
                subtitle: 'Francais',
                leading: Icon(Icons.language),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => LanguagesScreen()));
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'Parametres de compte',
            tiles: [
              SettingsTile(
                  title: 'Numero de telephone', leading: Icon(Icons.phone)),
              SettingsTile(title: 'Email', leading: Icon(Icons.email)),
              SettingsTile(
                  title: 'Changer Mot de Passe',
                  leading: Icon(Icons.lock),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ForgetScreen()));
                  }),
              SettingsTile(
                title: 'Se Deconnecter',
                leading: Icon(Icons.exit_to_app),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen()));
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'Notifications',
            tiles: [
              SettingsTile.switchTile(
                title: 'Envoie Notification par Email',
                leading: Icon(Icons.phonelink_lock),
                switchValue: envoieNotifParEmail,
                onToggle: (bool value) {
                  setState(() {
                    envoieNotifParEmail = value;
                    notificationsEnabled = value;
                  });
                },
              ),
              SettingsTile.switchTile(
                title: 'Activer Notifications',
                enabled: notificationsEnabled,
                leading: Icon(Icons.notifications_active),
                switchValue: true,
                onToggle: (value) {},
              ),
            ],
          ),
          CustomSection(
            child: Column(
              children: [
                Text(
                  'MoCars 1.0.0 (2020)',
                  style: TextStyle(color: Color(0xFF777777)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
