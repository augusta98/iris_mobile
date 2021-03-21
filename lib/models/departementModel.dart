class Departement {
  int id;
  String nomDept;

  Departement({
    this.id,
    this.nomDept,
  });
  Departement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomDept = json['nomDept'];
  }
}
