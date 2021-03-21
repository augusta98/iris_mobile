import 'package:IrisApps/data/database-helper.dart';
import 'package:IrisApps/models/anciens/Entretien_models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EntretienScreen extends StatefulWidget {
  @override
  _EntretienScreenState createState() => _EntretienScreenState();
}

class _EntretienScreenState extends State<EntretienScreen> {
  TextEditingController textController = new TextEditingController();
  final format = DateFormat("yyyy-MM-dd");
  List<RendezVous> tachesList = new List();

  @override
  void initState() {
    super.initState();

    DatabaseHelper.instance.recupererRdv().then((value) {
      setState(() {
        value.forEach((element) {
          tachesList
              .add(RendezVous(id: element['id'], DateRDV: element["DateRDV"]));
        });
      });
    }).catchError((error) {
      print(error);
    });
  }

  void _addToDb() async {
    String prochainRdv = textController.text;
    var id = await DatabaseHelper.instance
        .ajouterRdv(RendezVous(DateRDV: prochainRdv));
    setState(() {
      tachesList.insert(0, RendezVous(id: id, DateRDV: prochainRdv));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entretiens voiture"),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Quand est votre prochain rendez-vous?"),
                    controller: textController,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addToDb,
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                child: tachesList.isEmpty
                    ? Container()
                    : ListView.builder(itemBuilder: (ctx, index) {
                        if (index == tachesList.length) return null;
                        return ListTile(
                          title: Text(tachesList[index].DateRDV),
                          leading: Text(tachesList[index].id.toString()),
                        );
                      }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
