import 'package:IrisApps/data/Api_Helper.dart';

import 'package:IrisApps/models/AttendanceModel.dart';

class AttendanceRepository {
  ApiBaseHelper apiHelper = ApiBaseHelper();

  Future<List<Attendance>> fetchAttendanceList() async {
    final response = await apiHelper.get("attendance");
    return AttendanceResponse.fromJson(response).results;
  }
}
