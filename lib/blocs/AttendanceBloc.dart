import 'dart:async';
import 'package:IrisApps/data/Api_response.dart';
import 'package:IrisApps/repository/AttendanceRepository.dart';
import 'package:IrisApps/models/AttendanceModel.dart';

class AttendanceBloc {
  AttendanceRepository _attendanceRepository;
  StreamController _attendanceListController;
  StreamSink<ApiResponse<List<Attendance>>> get attendanceListSink =>
      _attendanceListController.sink;
  Stream<ApiResponse<List<Attendance>>> get attendanceListStream =>
      _attendanceListController.stream;
  AttendanceBloc() {
    _attendanceListController =
        StreamController<ApiResponse<List<Attendance>>>();
    _attendanceRepository = AttendanceRepository();
    fetchAttendanceList();
  }

  fetchAttendanceList() async {
    print("Fetching classe");
    attendanceListSink.add(ApiResponse.loading('Recuperation des classe'));
    try {
      List<Attendance> classe =
          await _attendanceRepository.fetchAttendanceList();
      print("List of Attendance in bloc");
      print(classe);
      attendanceListSink.add(ApiResponse.completed(classe));
    } catch (e) {
      attendanceListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _attendanceListController?.close();
  }
}
