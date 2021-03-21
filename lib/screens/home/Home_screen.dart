import 'package:IrisApps/Widgets/BottomNavigationBar.dart';
import 'package:IrisApps/Widgets/ChoixClasse.dart';
import 'package:IrisApps/Widgets/agence.dart';
import 'package:IrisApps/Widgets/drawer.dart';
import 'package:IrisApps/blocs/ClasseBloc.dart';
import 'package:IrisApps/common/common-error.dart';
import 'package:IrisApps/common/common-loading.dart';
import 'package:IrisApps/data/Api_response.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports

import '../../constants.dart';
import '../../models/ClasseModel.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  ClasseBloc _classeBloc;

  @override
  void initState() {
    super.initState();
    print("Initialisation de classeBloc");
    _classeBloc = ClasseBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appTitle)),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            // Padding(
            //   padding: EdgeInsets.only(left: 20.0, right: 120.0),
            //   child: Text(
            //     'Que cherchez vous?',
            //     style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            //   ),
            // ),
            SizedBox(height: 20.0),
            SizedBox(height: 20.0),
            Padding(
                padding: EdgeInsets.only(left: 0),
                child: RefreshIndicator(
                  onRefresh: () => _classeBloc.fetchClasseList(),
                  child: StreamBuilder<ApiResponse<List<Classe>>>(
                    stream: _classeBloc.classeListStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        switch (snapshot.data.status) {
                          case Status.LOADING:
                            return AffichageLoading(
                                loadingMessage: snapshot.data.message);
                            break;
                          case Status.COMPLETED:
                            print("Affichage du resultat");
                            print(snapshot.data.data);
                            return ChoixClasse(classeList: snapshot.data.data);
                            break;
                          case Status.ERROR:
                            return AffichageError(
                              errorMessage: snapshot.data.message,
                              onRetryPressed: () =>
                                  _classeBloc.fetchClasseList(),
                            );
                            break;
                        }
                      }
                      return Container();
                    },
                  ),
                )),
            // ChoixMecanicien(),
            // ClasseScreen(),
            SizedBox(height: 20.0),
            Agence(),
          ],
        ),
      ),
      bottomNavigationBar: AfficheBottom(currentTab: _currentTab),
      drawer: AfficheDrawer(),
    );
  }

  @override
  void dispose() {
    _classeBloc.dispose();
    super.dispose();
  }
}
