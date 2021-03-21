import 'dart:async';

import 'package:IrisApps/data/Api_response.dart';
import 'package:IrisApps/models/AttendanceModel.dart';

import 'package:IrisApps/repository/AttendanceDetailRepository.dart';
import 'package:IrisApps/models/AttendanceModel.dart';

class AttendanceDetailBloc {
  AttendanceDetailRepository _attendanceDetailRepository;
  StreamController _attendanceDetailController;
  StreamSink<ApiResponse<Attendance>> get attendanceDetailSink =>
      _attendanceDetailController.sink;
  Stream<ApiResponse<Attendance>> get attendanceDetailStream =>
      _attendanceDetailController.stream;
  AttendanceDetailBloc(selectedAttendance) {
    _attendanceDetailController = StreamController<ApiResponse<Attendance>>();
    _attendanceDetailRepository = AttendanceDetailRepository();
    fetchAttendanceDetail(selectedAttendance);
  }
  fetchAttendanceDetail(int selectedAttendance) async {
    attendanceDetailSink.add(ApiResponse.loading('Fetching Details'));
    try {
      Attendance details = await _attendanceDetailRepository
          .fetchAttendanceDetail(selectedAttendance);
      attendanceDetailSink.add(ApiResponse.completed(details));
    } catch (e) {
      attendanceDetailSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _attendanceDetailController?.close();
  }
}
