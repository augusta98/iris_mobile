import 'dart:async';

import 'package:IrisApps/data/Api_response.dart';

import 'package:IrisApps/repository/ClasseDetailRepository.dart';
import 'package:IrisApps/models/ClasseModel.dart';

class ClasseDetailBloc {
  ClasseDetailRepository _classeDetailRepository;
  StreamController _classeDetailController;
  StreamSink<ApiResponse<Classe>> get classeDetailSink =>
      _classeDetailController.sink;
  Stream<ApiResponse<Classe>> get classeDetailStream =>
      _classeDetailController.stream;
  ClasseDetailBloc(selectedMovie) {
    _classeDetailController = StreamController<ApiResponse<Classe>>();
    _classeDetailRepository = ClasseDetailRepository();
    fetchClasseDetail(selectedMovie);
  }
  fetchClasseDetail(int selectedMovie) async {
    classeDetailSink.add(ApiResponse.loading('Fetching Details'));
    try {
      Classe details =
          await _classeDetailRepository.fetchClasseDetail(selectedMovie);
      classeDetailSink.add(ApiResponse.completed(details));
    } catch (e) {
      classeDetailSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _classeDetailController?.close();
  }
}
