import 'package:IrisApps/data/Api_Helper.dart';
import 'package:IrisApps/models/AttendanceModel.dart';

class AttendanceDetailRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<Attendance> fetchAttendanceDetail(int attendanceId) async {
    final response = await _helper.get("attendance/$attendanceId");
    return Attendance.fromJson(response);
  }
}
