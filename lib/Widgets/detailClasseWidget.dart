import 'package:IrisApps/Widgets/BottomNavigationBar.dart';
import 'package:IrisApps/Widgets/drawer.dart';
import 'package:IrisApps/models/ClasseModel.dart';
import 'package:IrisApps/models/CoursModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'listViewSequence.dart';

class DetailClasseStatefulWidget extends StatefulWidget {
  final Classe classeSelectionne;
  DetailClasseStatefulWidget({Key key, this.classeSelectionne})
      : super(key: key);

  @override
  _DetailClasseStatefulWidgetState createState() =>
      _DetailClasseStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _DetailClasseStatefulWidgetState
    extends State<DetailClasseStatefulWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    int _currentTab = 0;
    List<Cours> listeCours = widget.classeSelectionne.listCours;
    print("Affichage des cours de la classe selectionnée");
    print(widget.classeSelectionne.listCours);
    return Scaffold(
      appBar: AppBar(title: Text(appTitle)),
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations:
                buildNavigationDestination(widget.classeSelectionne.listCours),
          ),
          VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            // child: Center(
            //   child: Text(listeCours[_selectedIndex].nomCours),
            // ),
            child: Center(
              child: ListeViewSequence(
                  sequenceListe: listeCours[_selectedIndex].listeSequence),
            ),
          )
        ],
      ),
      bottomNavigationBar: AfficheBottom(currentTab: _currentTab),
      drawer: AfficheDrawer(),
    );
  }

  List<NavigationRailDestination> buildNavigationDestination(
      List<Cours> coursList) {
    List<NavigationRailDestination> navigationList =
        new List<NavigationRailDestination>();

    coursList.forEach((cours) {
      navigationList.add(NavigationRailDestination(
        icon: Icon(Icons.bookmark_border),
        selectedIcon: Icon(Icons.book),
        label: Text(cours.nomCours),
      ));
    });

    return navigationList;
  }
}
