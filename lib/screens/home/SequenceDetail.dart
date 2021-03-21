import 'package:IrisApps/Widgets/BottomNavigationBar.dart';
import 'package:IrisApps/Widgets/drawer.dart';
import 'package:IrisApps/constants.dart';
import 'package:IrisApps/models/AttendanceDataSource.dart';

import 'package:IrisApps/models/SequenceModel.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailSequenceStatefulWidget extends StatefulWidget {
  final Sequence currentSequence;
  DetailSequenceStatefulWidget({Key key, this.currentSequence})
      : super(key: key);

  @override
  _DetailSequenceStatefulWidgetState createState() =>
      _DetailSequenceStatefulWidgetState();
}

class _DetailSequenceStatefulWidgetState
    extends State<DetailSequenceStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    int _currentTab = 0;
    int _rowParPage = 10;
    int _rowIndex = 0;
    AttendanceDataSource attendanceDataSource = AttendanceDataSource(
        listAttendance: widget.currentSequence.listeAttendance);
    return new Scaffold(
      appBar: AppBar(title: Text(appTitle)),
      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            PaginatedDataTable(
                header: Text(
                    'Attendance pour ${DateFormat('EEE d MMM yy', 'fr_FR').format(widget.currentSequence.dateSequence)}'),
                rowsPerPage: _rowParPage,
                // onRowsPerPageChanged: (value) {
                //   setState(() {
                //     _rowParPage = value;
                //   });
                // },

                columns: [
                  DataColumn(
                    label: Text("Nom Etudiant"),
                  ),
                  DataColumn(
                    label: Text("Prenom Etudiant"),
                  ),
                ],
                source: attendanceDataSource)
          ],
        ),
      ),
      bottomNavigationBar: AfficheBottom(currentTab: _currentTab),
      // drawer: AfficheDrawer(),
    );
  }
}
