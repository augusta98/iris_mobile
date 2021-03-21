import 'package:IrisApps/models/SequenceModel.dart';
import 'package:IrisApps/screens/home/SequenceDetail.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class ListeViewSequence extends StatefulWidget {
  final List<Sequence> sequenceListe;
  ListeViewSequence({this.sequenceListe});
  @override
  _ListeViewSequenceState createState() => _ListeViewSequenceState();
}

class _ListeViewSequenceState extends State<ListeViewSequence> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
          itemCount: widget.sequenceListe.length,
          itemBuilder: (BuildContext context, int index) {
            Sequence currentSequence = widget.sequenceListe[index];

            return Stack(
              children: <Widget>[
                Container(
                  // margin: EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
                  height: 150.0,
                  width: double.infinity,
                  // decoration: BoxDecoration(
                  //     color: Colors.blueGrey,
                  //     borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailSequenceStatefulWidget(
                                  currentSequence: currentSequence,
                                ),
                              )),
                          child: Card(
                            child: ListTile(
                              // leading: FlutterLogo(size: 72.0),
                              title: Container(
                                // width: 250.0,
                                child: Text(
                                  'Seq du ${DateFormat('EEE d MMM yy', 'fr_FR').format(currentSequence.dateSequence)}',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                  // maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              // subtitle: Text(currentSequence.id.toString()),
                              subtitle: ChoiceChip(
                                label: Text('Annulé'),
                                selected: currentSequence.annulee,
                                selectedColor: Color(0xFFFF5252),
                              ),
                              trailing: Icon(Icons.more_vert),
                              isThreeLine: true,
                            ),
                          ),
                        ),
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
