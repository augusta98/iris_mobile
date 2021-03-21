import 'dart:async';
import 'package:IrisApps/data/Api_response.dart';
import 'package:IrisApps/repository/ClasseRepository.dart';
import 'package:IrisApps/models/ClasseModel.dart';

class ClasseBloc {
  ClasseRepository _classeRepository;
  StreamController _classeListController;
  StreamSink<ApiResponse<List<Classe>>> get classeListSink =>
      _classeListController.sink;
  Stream<ApiResponse<List<Classe>>> get classeListStream =>
      _classeListController.stream;
  ClasseBloc() {
    _classeListController = StreamController<ApiResponse<List<Classe>>>();
    _classeRepository = ClasseRepository();
    fetchClasseList();
  }

  fetchClasseList() async {
    print("Fetching classe");
    classeListSink.add(ApiResponse.loading('Recuperation des classe'));
    try {
      List<Classe> classe = await _classeRepository.fetchClasseList();
      print("List of classes in bloc");
      print(classe);
      classeListSink.add(ApiResponse.completed(classe));
    } catch (e) {
      classeListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _classeListController?.close();
  }
}
