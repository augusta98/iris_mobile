import 'package:IrisApps/blocs/CoursBloc.dart';
import 'package:IrisApps/common/common-error.dart';
import 'package:IrisApps/common/common-loading.dart';

import 'package:IrisApps/data/Api_response.dart';
import 'package:IrisApps/models/CoursModel.dart';
import 'package:IrisApps/screens/home/CoursDetail.dart';

import 'package:flutter/material.dart';

class CoursScreen extends StatefulWidget {
  @override
  _CoursScreenState createState() => _CoursScreenState();
}

class _CoursScreenState extends State<CoursScreen> {
  CoursBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = CoursBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Courssss',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => _bloc.fetchCoursList(),
        child: StreamBuilder<ApiResponse<List<Cours>>>(
          stream: _bloc.coursListStream,
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
                  return CoursList(listeCours: snapshot.data.data);
                  break;
                case Status.ERROR:
                  return AffichageError(
                    errorMessage: snapshot.data.message,
                    onRetryPressed: () => _bloc.fetchCoursList(),
                  );
                  break;
              }
            }
            return Container();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}

class CoursList extends StatelessWidget {
  final List<Cours> listeCours;
  const CoursList({Key key, this.listeCours}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("Liste des courss dans le view");
    print(listeCours);
    return GridView.builder(
      itemCount: listeCours.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5 / 1.8,
      ),
      itemBuilder: (context, index) {
        print("Affichage element avec index: " + index.toString());
        print("Id: " + listeCours[index].id.toString());
        print("Descript: " + listeCours[index].nomCours);
        print("Depart: " + listeCours[index].descriptionCours);
        // print("Annee: " + listeCours[index].anneeScolaire);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CoursDetail(listeCours[index].id)));
            },
            child: Card(
              child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    listeCours[index].descriptionCours,
                    textScaleFactor: 1,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ),
          ),
        );
      },
    );
  }
}
