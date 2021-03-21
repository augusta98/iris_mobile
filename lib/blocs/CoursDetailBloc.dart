import 'dart:async';

import 'package:IrisApps/data/Api_response.dart';
import 'package:IrisApps/repository/CoursDetail.dart';
import 'package:IrisApps/models/CoursModel.dart';

class CoursDetailBloc {
  CoursDetailRepository _coursDetailRepository;
  StreamController _coursDetailController;
  StreamSink<ApiResponse<Cours>> get coursDetailSink =>
      _coursDetailController.sink;
  Stream<ApiResponse<Cours>> get coursDetailStream =>
      _coursDetailController.stream;
  CoursDetailBloc(selectedCours) {
    _coursDetailController = StreamController<ApiResponse<Cours>>();
    _coursDetailRepository = CoursDetailRepository();
    fetchCoursDetail(selectedCours);
  }
  fetchCoursDetail(int selectedCours) async {
    coursDetailSink.add(ApiResponse.loading('Fetching Details'));
    try {
      Cours details =
          await _coursDetailRepository.fetchCoursDetail(selectedCours);
      coursDetailSink.add(ApiResponse.completed(details));
    } catch (e) {
      coursDetailSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _coursDetailController?.close();
  }
}
