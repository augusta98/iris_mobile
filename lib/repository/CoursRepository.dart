import 'package:IrisApps/data/Api_Helper.dart';

import 'package:IrisApps/models/CoursModel.dart';

class CoursRepository {
  ApiBaseHelper apiHelper = ApiBaseHelper();

  Future<List<Cours>> fetchCoursList() async {
    final response = await apiHelper.get("cours");
    return CoursResponse.fromJson(response).results;
  }
}
