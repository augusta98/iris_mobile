import 'dart:async';
import 'package:IrisApps/data/Api_response.dart';
import 'package:IrisApps/repository/CoursRepository.dart';
import 'package:IrisApps/models/CoursModel.dart';

class CoursBloc {
  CoursRepository _coursRepository;
  StreamController _coursListController;
  StreamSink<ApiResponse<List<Cours>>> get coursListSink =>
      _coursListController.sink;
  Stream<ApiResponse<List<Cours>>> get coursListStream =>
      _coursListController.stream;
  CoursBloc() {
    _coursListController = StreamController<ApiResponse<List<Cours>>>();
    _coursRepository = CoursRepository();
    fetchCoursList();
  }

  fetchCoursList() async {
    coursListSink.add(ApiResponse.loading('Recuperation des Cours'));
    try {
      List<Cours> cours = await _coursRepository.fetchCoursList();
      coursListSink.add(ApiResponse.completed(cours));
    } catch (e) {
      coursListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _coursListController?.close();
  }
}
