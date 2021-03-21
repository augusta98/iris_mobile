import 'package:IrisApps/blocs/AttendanceBloc.dart';
import 'package:IrisApps/common/common-error.dart';
import 'package:IrisApps/common/common-loading.dart';

import 'package:IrisApps/data/Api_response.dart';
import 'package:IrisApps/models/AttendanceModel.dart';
import 'package:IrisApps/screens/home/SequenceDetail.dart';

import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  AttendanceBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = AttendanceBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0.0,
        title: Text(
          'Attendance',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => _bloc.fetchAttendanceList(),
        child: StreamBuilder<ApiResponse<List<Attendance>>>(
          stream: _bloc.attendanceListStream,
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
                  return AttendanceList(listeAttendance: snapshot.data.data);
                  break;
                case Status.ERROR:
                  return AffichageError(
                    errorMessage: snapshot.data.message,
                    onRetryPressed: () => _bloc.fetchAttendanceList(),
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

class AttendanceList extends StatelessWidget {
  final List<Attendance> listeAttendance;
  AttendanceList({Key key, this.listeAttendance}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("Liste des attendances dans le view");
    print(listeAttendance);
    return GridView.builder(
      itemCount: listeAttendance.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5 / 1.8,
      ),
      itemBuilder: (context, index) {
        print("Affichage element avec index: " + index.toString());
        print("Id: " + listeAttendance[index].id.toString());
        print("Descript: " + listeAttendance[index].sequence);
        print("Depart: " + listeAttendance[index].etudiant.nomEtudiant);
        // print("Annee: " + listeAttendance[index].anneeScolaire);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => null));
            },
            child: Card(
              child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    listeAttendance[index].sequence,
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
