import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class LanguagesScreen extends StatefulWidget {
  @override
  _LanguagesScreenState createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  int languageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Langues')),
      body: SettingsList(
        sections: [
          SettingsSection(tiles: [
            SettingsTile(
              title: "Anglais",
              trailing: trailingWidget(0),
              onTap: () {
                changerLangues(0);
              },
            ),
            SettingsTile(
              title: "Espagnol",
              trailing: trailingWidget(1),
              onTap: () {
                changerLangues(1);
              },
            ),
            SettingsTile(
              title: "Francais",
              trailing: trailingWidget(2),
              onTap: () {
                changerLangues(2);
              },
            ),
            SettingsTile(
              title: "Allemand",
              trailing: trailingWidget(3),
              onTap: () {
                changerLangues(3);
              },
            ),
          ]),
        ],
      ),
    );
  }

  Widget trailingWidget(int index) {
    return (languageIndex == index)
        ? Icon(Icons.check, color: Colors.blue)
        : Icon(null);
  }

  void changerLangues(int index) {
    setState(() {
      languageIndex = index;
    });
  }
}
