// ignore: unused_import

import 'package:IrisApps/models/anciens/agences_models.dart';
import 'package:flutter/material.dart';

class AgenceScreen extends StatefulWidget {
  final Agences agenceCourant;
  AgenceScreen({this.agenceCourant});

  @override
  _AgenceDestinationScreenState createState() =>
      _AgenceDestinationScreenState();
}

class _AgenceDestinationScreenState extends State<AgenceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exclusivites des agences"),
      ),
      // backgroundColor: Colors.blue,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Promotion",
              textScaleFactor: 2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      ),
                    ]),
                child: Hero(
                  tag: widget.agenceCourant.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage(widget.agenceCourant.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: <Widget>[
              //       IconButton(
              //         icon: Icon(Icons.arrow_back),
              //         iconSize: 30.0,
              //         color: Colors.black,
              //         onPressed: () => Navigator.pop(context),
              //       ),
              //       Row(
              //         children: <Widget>[
              //           IconButton(
              //             icon: Icon(Icons.search),
              //             iconSize: 30.0,
              //             color: Colors.black,
              //             onPressed: () => Navigator.pop(context),
              //           ),

              //           // IconButton(
              //           //   icon: Icon(FontAwesomeIcons.),
              //           //   iconSize: 25.0,
              //           //   color: Colors.black,
              //           //   onPressed: () => Navigator.pop(context),
              //           // ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 2.0),
                child: Table(
                  children: [
                    TableRow(children: [
                      Text(
                        "Promotion",
                        textScaleFactor: 1.5,
                      ),
                      Text("Nom agence", textScaleFactor: 1.5),
                      Text("Promotions ", textScaleFactor: 1.5),
                    ]),
                    TableRow(children: [
                      Text("MUA", textScaleFactor: 1.5),
                      Text("ABESEC", textScaleFactor: 1.5),
                      Text("AKTU", textScaleFactor: 1.5),
                    ]),
                    TableRow(children: [
                      Text("12th", textScaleFactor: 1.5),
                      Text("Delhi Public School", textScaleFactor: 1.5),
                      Text("CBSE", textScaleFactor: 1.5),
                    ]),
                    TableRow(children: [
                      Text("High School", textScaleFactor: 1.5),
                      Text("SFS", textScaleFactor: 1.5),
                      Text("ICSE", textScaleFactor: 1.5),
                    ]),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
