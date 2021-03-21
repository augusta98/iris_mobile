import 'package:IrisApps/models/AttendanceModel.dart';
import 'package:flutter/material.dart';

class AttendanceDataSource extends DataTableSource {
  final List<Attendance> listAttendance;

  AttendanceDataSource({this.listAttendance});

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= listAttendance.length) return null;
    final attendance = listAttendance[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(attendance.etudiant.nomEtudiant)),
      DataCell(Text(attendance.etudiant.prenomEtudiant))
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => listAttendance.length;

  @override
  int get selectedRowCount => 0;
}
