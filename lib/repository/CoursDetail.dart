import 'package:IrisApps/data/Api_Helper.dart';
import 'package:IrisApps/models/CoursModel.dart';

class CoursDetailRepository {
  ApiBaseHelper _helper = ApiBaseHelper();
  Future<Cours> fetchCoursDetail(int coursId) async {
    final response = await _helper.get("cours/$coursId");
    return Cours.fromJson(response);
  }
}
