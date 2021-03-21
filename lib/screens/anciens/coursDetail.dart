import 'package:IrisApps/blocs/CoursDetailBloc.dart';
import 'package:IrisApps/common/common-error.dart';
import 'package:IrisApps/common/common-loading.dart';
import 'package:IrisApps/data/Api_response.dart';
import 'package:IrisApps/models/CoursModel.dart';
import 'package:flutter/material.dart';

class CoursDetail extends StatefulWidget {
  final int selectedMovie;
  const CoursDetail(this.selectedMovie);
  @override
  _CoursDetailState createState() => _CoursDetailState();
}

class _CoursDetailState extends State<CoursDetail> {
  CoursDetailBloc _coursDetailBloc;
  @override
  void initState() {
    super.initState();
    _coursDetailBloc = CoursDetailBloc(widget.selectedMovie);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Cours',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            _coursDetailBloc.fetchCoursDetail(widget.selectedMovie),
        child: StreamBuilder<ApiResponse<Cours>>(
          stream: _coursDetailBloc.coursDetailStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data.status) {
                case Status.LOADING:
                  return AffichageLoading(
                      loadingMessage: snapshot.data.message);
                  break;
                case Status.COMPLETED:
                  return ShowCoursDetail(displayCours: snapshot.data.data);
                  break;
                case Status.ERROR:
                  return AffichageError(
                    errorMessage: snapshot.data.message,
                    onRetryPressed: () =>
                        _coursDetailBloc.fetchCoursDetail(widget.selectedMovie),
                  );
                  break;
              }
            }
            return Container();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _coursDetailBloc.dispose();
    super.dispose();
  }
}

class ShowCoursDetail extends StatelessWidget {
  final Cours displayCours;
  ShowCoursDetail({Key key, this.displayCours}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        new SingleChildScrollView(
          child: new Container(
            margin: const EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                new Container(
                  alignment: Alignment.center,
                  child: new Container(
                    width: 400.0,
                    height: 400.0,
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 0.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                          child: new Text(
                        displayCours.nomCours,
                        style: new TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                            fontFamily: 'Arvo'),
                      )),
                      new Text(
                        displayCours.descriptionCours,
//                      '${widget.movie['vote_average']}/10',
                        style: new TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontFamily: 'Arvo'),
                      )
                    ],
                  ),
                ),
                new Text(displayCours.professeur,
                    style:
                        new TextStyle(color: Colors.black, fontFamily: 'Arvo')),
                new Padding(padding: const EdgeInsets.all(10.0)),
                new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new Container(
                      width: 150.0,
                      height: 60.0,
                      alignment: Alignment.center,
                      child: new Text(
                        'Rate Movie',
                        style: new TextStyle(
                            color: Colors.black,
                            fontFamily: 'Arvo',
                            fontSize: 20.0),
                      ),
                      decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(10.0),
                          color: const Color(0xaa3C3261)),
                    )),
                    new Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: new Container(
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: new Icon(
                          Icons.share,
                          color: Colors.black,
                        ),
                        decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(10.0),
                            color: const Color(0xaa3C3261)),
                      ),
                    ),
                    new Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Container(
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: new Icon(
                            Icons.bookmark,
                            color: Colors.black,
                          ),
                          decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(10.0),
                              color: const Color(0xaa3C3261)),
                        )),
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
