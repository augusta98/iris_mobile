import 'package:IrisApps/Widgets/BottomNavigationBar.dart';
import 'package:IrisApps/Widgets/drawer.dart';
import 'package:IrisApps/Widgets/listViewMecanicien.dart';
import 'package:IrisApps/constants.dart';

import 'package:IrisApps/models/anciens/activity_models.dart';
import 'package:IrisApps/models/anciens/destination-models.dart';
import 'package:IrisApps/models/anciens/mecanicien_models.dart';
import 'package:IrisApps/models/anciens/ville_icone_models.dart';

import 'package:flutter/material.dart';

class ListeMecanicienScreen extends StatefulWidget {
  @override
  _ListeMecanicienScreenState createState() => _ListeMecanicienScreenState();
}

class _ListeMecanicienScreenState extends State<ListeMecanicienScreen> {
  int _choixIndex = 0;
  int _currentTab = 1;

  List<Activity> list = destinationList[0].activities;
  List<VilleIcone> _icons = [
    VilleIcone(ville: "Rose Hill", icon: Icons.camera),
    VilleIcone(ville: "Curepipe", icon: Icons.help),
    VilleIcone(ville: "Port Louis", icon: Icons.people),
    VilleIcone(ville: "Moka", icon: Icons.home)
  ];
  Widget _buildIcon(int index) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _choixIndex = index;
            // list.clear();
            list = destinationList[_choixIndex].activities;
          });
          print(_choixIndex);
        },
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                  color: _choixIndex == index
                      ? Theme.of(context).accentColor
                      : Color(0XFFE7EBEE),
                  borderRadius: BorderRadius.circular(3)),
              child: Icon(
                _icons[index].icon,
                size: 25.0,
                color: _choixIndex == index
                    ? Theme.of(context).primaryColor
                    : Color(0xFFB4C1C4),
              ),
            ),
            Positioned(
              bottom: 5.0,
              child: Text(_icons[index].ville),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appTitle)),
      body: Column(children: <Widget>[
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _icons
              .asMap()
              .entries
              .map(
                (MapEntry map) => _buildIcon(map.key),
              )
              .toList(),
        ),
        ListeViewMecanicien(
          mecanicienList: mecaniciens,
        )
      ]),
      bottomNavigationBar: AfficheBottom(currentTab: _currentTab),
      drawer: AfficheDrawer(),
    );
  }
}
