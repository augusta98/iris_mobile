import 'package:IrisApps/models/AttendanceModel.dart';

class SequenceResponse {
  int totalResults;
  List<Sequence> results;

  SequenceResponse({this.totalResults, this.results});

  SequenceResponse.fromJson(dynamic json) {
    if (json != null) {
      results = new List<Sequence>();
      json.forEach((v) {
        results.add(new Sequence.fromJson(v));
      });
    }
  }
}

class Sequence {
  int id;
  DateTime dateSequence;
  bool annulee;
  List<Attendance> listeAttendance;

  Sequence({
    this.id,
    this.dateSequence,
    this.annulee,
    this.listeAttendance,
  });
  Sequence.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['dateSequence'] != null) {
      dateSequence = DateTime.parse(json['dateSequence']);
    }

    annulee = json['annulee'];
    listeAttendance = getListAttendance(json['listeAttendance']);
  }
  getListAttendance(dynamic json) {
    List<Attendance> reponse = new List<Attendance>();
    if (json != null) {
      json.forEach((v) {
        reponse.add(new Attendance.fromJson(v));
      });
    }
    return reponse;
  }
}
