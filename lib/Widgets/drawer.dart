import 'package:IrisApps/screens/anciens/entrentien_screens.dart';
import 'package:IrisApps/screens/apropos/apropos_screen.dart';


import 'package:IrisApps/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class AfficheDrawer extends StatefulWidget {
  @override
  _AfficheDrawerState createState() => _AfficheDrawerState();
}

class _AfficheDrawerState extends State<AfficheDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
          child: Text("Menu"),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          // subtitle: Text("......"),
          title: Text("Entretien Voiture"),
          trailing: Wrap(
            spacing: 12, // espace entre le deux icons
            children: <Widget>[
              Icon(Icons.directions_car), // icon-1
              Icon(Icons.arrow_right), // icon-2
            ],
          ),
          onTap: () {
            setState(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EntretienScreen()));
            });
          },
        ),
        ListTile(
          // subtitle: Text("......"),
          title: Text("Photographier Accident"),
          trailing: Wrap(
            spacing: 12, // espace entre le deux icons
            children: <Widget>[
              Icon(Icons.photo_camera),
              // icon-1
              Icon(Icons.arrow_right), // icon-2
            ],
          ),
          onTap: () {},
        ),
        ListTile(
          // subtitle: Text("......"),
          title: Text("Urgence"),
          trailing: Wrap(
            spacing: 12, // espace entre le deux icons
            children: <Widget>[
              Icon(Icons.dialer_sip), // icon-1
              Icon(Icons.arrow_right), // icon-2
            ],
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text("Parametres"),
          trailing: Wrap(
            spacing: 12, // espace entre le deux icons
            children: <Widget>[
              Icon(Icons.help), // icon-1
              Icon(Icons.arrow_right), // icon-2
            ],
          ),
          onTap: () {
            setState(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()));
            });
          },
        ),
        ListTile(
          // subtitle: Text("......"),
          title: Text("A propos de nous"),
          trailing: Wrap(
            spacing: 12, // espace entre le deux icons
            children: <Widget>[
              Icon(Icons.people), // icon-1
              Icon(Icons.arrow_right), // icon-2
            ],
          ),
          onTap: () {
            setState(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AproposScreen()));
            });
          },
        ),
      ]),
    );
  }
}
