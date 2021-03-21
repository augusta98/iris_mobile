class Detenteur {
  String nom;
  String prenom;
  String email;
  String password;
  String confirmPassword;

  Detenteur(
      {this.nom, this.prenom, this.email, this.password, this.confirmPassword});

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["nom"] = nom;
    map["prenom"] = prenom;
    map["email"] = email;
    map["password"] = password;
    return map;
  }
}
