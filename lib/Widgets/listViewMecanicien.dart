import 'package:IrisApps/common/common-function.dart';
import 'package:IrisApps/models/anciens/mecanicien_models.dart';
import 'package:flutter/material.dart';

class ListeViewMecanicien extends StatefulWidget {
  final List<Mecanicien> mecanicienList;
  ListeViewMecanicien({this.mecanicienList});
  @override
  _ListeViewMecanicienState createState() => _ListeViewMecanicienState();
}

class _ListeViewMecanicienState extends State<ListeViewMecanicien> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
          itemCount: widget.mecanicienList.length,
          itemBuilder: (BuildContext context, int index) {
            Mecanicien currentMecanicien = widget.mecanicienList[index];
            return Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
                  height: 150.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(50.0, 20.0, 20.0, 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 250.0,
                              child: Text(
                                '${currentMecanicien.nommecanicien} ${currentMecanicien.prenommecanicien} ',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                                // maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          currentMecanicien.specialite,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        CommonFunction.buildRatingStars(
                            currentMecanicien.rating),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 70.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: Alignment.center,
                              child: Text(currentMecanicien.heureOuverture),
                            ),
                            SizedBox(width: 10.0),
                            Container(
                              width: 70.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: Alignment.center,
                              child: Text(currentMecanicien.heureFermeture),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
