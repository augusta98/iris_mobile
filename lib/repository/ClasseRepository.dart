import 'package:IrisApps/data/Api_Helper.dart';

import 'package:IrisApps/models/ClasseModel.dart';

class ClasseRepository {
  ApiBaseHelper apiHelper = ApiBaseHelper();

  Future<List<Classe>> fetchClasseList() async {
    final response = await apiHelper.get("classe");
    return ClasseResponse.fromJson(response).results;
  }
}
