class RendezVous {
  int id;
  String DateRDV;

  RendezVous({this.id, this.DateRDV});

  Map<String, dynamic> toMap() {
    return {'id': id, 'DateRDV': DateRDV};
  }
}
