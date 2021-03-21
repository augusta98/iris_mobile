import 'package:IrisApps/models/EtudiantModel.dart';

class AttendanceResponse {
  int totalResults;
  List<Attendance> results;

  AttendanceResponse({this.totalResults, this.results});

  AttendanceResponse.fromJson(dynamic json) {
    if (json != null) {
      results = new List<Attendance>();
      json.forEach((v) {
        results.add(new Attendance.fromJson(v));
      });
    }
  }
}

class Attendance {
  int id;
  String sequence;
  Etudiant etudiant;

  Attendance({
    this.id,
    this.sequence,
    this.etudiant,
  });
  Attendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sequence = json['sequence'];
    etudiant = new Etudiant.fromJson(json['etudiant']);
  }
}

//
