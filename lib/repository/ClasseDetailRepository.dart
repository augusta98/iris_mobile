import 'package:IrisApps/data/Api_Helper.dart';
import 'package:IrisApps/models/ClasseModel.dart';

class ClasseDetailRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<Classe> fetchClasseDetail(int classeId) async {
    final response = await _helper.get("classe/$classeId");
    return Classe.fromJson(response);
  }
}
