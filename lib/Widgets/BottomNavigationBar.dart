import 'package:IrisApps/screens/anciens/liste_mecanicien.dart';
import 'package:IrisApps/screens/home/AttendanceListe.dart';
import 'package:IrisApps/screens/home/Home_screen.dart';
import 'package:IrisApps/screens/home/liste_sequence.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AfficheBottom extends StatefulWidget {
  int currentTab;

  AfficheBottom({this.currentTab});
  @override
  _AfficheBottomState createState() => _AfficheBottomState();
}

class _AfficheBottomState extends State<AfficheBottom> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: widget.currentTab,
        onTap: (tabIndex) {
          setState(() {
            widget.currentTab = tabIndex;
            switch (tabIndex) {
              case 0:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
                break;
              case 1:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListeMecanicienScreen()));
                break;
              case 2:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListeSequenceScreen()));
                break;
              case 3:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AttendanceScreen()));
                break;
            }
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 8,
        unselectedFontSize: 10,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Accueil"),
            backgroundColor: (Colors.black),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.people),
          //   title: Text("Assurance"),
          //   backgroundColor: (Colors.blue),
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.help),
          //   title: Text("Services"),
          //   backgroundColor: (Colors.purple[100]),
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_ind_outlined),
            title: Text("Attendance"),
            backgroundColor: (Colors.yellowAccent),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Recherche"),
            backgroundColor: (Colors.purple),
          ),
        ]);
  }
}
