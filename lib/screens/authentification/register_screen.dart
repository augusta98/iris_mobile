import 'package:IrisApps/data/database-helper.dart';
import 'package:IrisApps/models/anciens/Detenteur-models.dart';

import 'package:flutter/material.dart';
import '../../constants.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegisterScreen> {
  final formKey = new GlobalKey<FormState>();
  String nom, prenom, email, password, confirmPassword;

  @override
  Widget build(BuildContext context) {
    void submit() {
      final form = formKey.currentState;

      if (form.validate()) {
        setState(() {
          form.save();
          Detenteur nouveauDetenteur = new Detenteur();
          nouveauDetenteur.nom = nom.trim();
          nouveauDetenteur.prenom = prenom.trim();
          nouveauDetenteur.email = email.trim();
          nouveauDetenteur.password = password.trim();
          nouveauDetenteur.confirmPassword = confirmPassword.trim();

          var db = new DatabaseHelper();
          db.sauvegarderUtilisateur(nouveauDetenteur);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: ListView(children: <Widget>[
        Column(
          children: <Widget>[
            Image.asset(logoImage),
            Text(
              'Bienvenue à $appTitle',
              style: TextStyle(fontSize: 20),
            ),
            Form(
              key: formKey,
              child: Column(children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.name,
                  onSaved: (value) => nom = value,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      labelText: "Entrez Votre nom"),
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  onSaved: (value) => prenom = value,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      labelText: "Entrez Votre Prénom"),
                ),
                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) => email = value,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: "Entrez Votre Email Adresse")),
                TextFormField(
                  obscureText: true,
                  onSaved: (value) => password = value,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Entrez Votre mot de passe"),
                ),
                TextFormField(
                  obscureText: true,
                  onSaved: (value) => confirmPassword = value,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Confirmer Votre mot de passe"),
                ),
              ]),
            ),
            RaisedButton(child: Text("S'Enregistrer"), onPressed: submit),
          ],
        ),
      ]),
    );
  }
}
