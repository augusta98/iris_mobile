import 'package:IrisApps/blocs/ClasseBloc.dart';
import 'package:IrisApps/common/common-error.dart';
import 'package:IrisApps/common/common-loading.dart';

import 'package:IrisApps/data/Api_response.dart';
import 'package:IrisApps/models/ClasseModel.dart';
import 'package:IrisApps/screens/home/ClasseDetail.dart';

import 'package:flutter/material.dart';

class ClasseScreen extends StatefulWidget {
  @override
  _ClasseScreenState createState() => _ClasseScreenState();
}

class _ClasseScreenState extends State<ClasseScreen> {
  ClasseBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = ClasseBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Classe',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => _bloc.fetchClasseList(),
        child: StreamBuilder<ApiResponse<List<Classe>>>(
          stream: _bloc.classeListStream,
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
                  return ClasseList(listeClasse: snapshot.data.data);
                  break;
                case Status.ERROR:
                  return AffichageError(
                    errorMessage: snapshot.data.message,
                    onRetryPressed: () => _bloc.fetchClasseList(),
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

class ClasseList extends StatelessWidget {
  final List<Classe> listeClasse;
  const ClasseList({Key key, this.listeClasse}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("Liste des classes dans le view");
    print(listeClasse);
    return GridView.builder(
      itemCount: listeClasse.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5 / 1.8,
      ),
      itemBuilder: (context, index) {
        print("Affichage element avec index: " + index.toString());
        print("Id: " + listeClasse[index].id.toString());
        print("Descript: " + listeClasse[index].descriptionClasse);
        print("Depart: " + listeClasse[index].departement.nomDept);
        print("Annee: " + listeClasse[index].anneeScolaire);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ClasseDetail(listeClasse[index].id)));
            },
            child: Card(
              child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    listeClasse[index].descriptionClasse,
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
