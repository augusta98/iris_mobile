import 'package:flutter/material.dart';

class ExclusiviteScreen extends StatefulWidget {
  @override
  _ExclusiviteState createState() => _ExclusiviteState();
}

class _ExclusiviteState extends State<ExclusiviteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exclusivites des agences"),
        backgroundColor: Colors.green,
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Table",
            textScaleFactor: 2,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            // textDirection: TextDirection.rtl,
            // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            // border:TableBorder.all(width: 2.0,color: Colors.red),
            children: [
              TableRow(children: [
                Text(
                  "Promotion",
                  textScaleFactor: 1.5,
                ),
                Text("Nom de l'agence", textScaleFactor: 1.5),
                Text("Promotions proposee", textScaleFactor: 1.5),
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
        ),
      ]),
    );
  }
}
