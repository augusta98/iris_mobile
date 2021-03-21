import 'package:IrisApps/constants.dart';
import 'package:IrisApps/data/database-helper.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class ForgetScreen extends StatefulWidget {
  _ForgetScreenState createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String email, password;

  @override
  Widget build(BuildContext context) {
    void reinitialiser() {
      final form = formKey.currentState;

      if (form.validate()) {
        setState(() {
          form.save();
          if (email == null ||
              email.trim() == '' ||
              password == null ||
              password.trim() == '') {
            _scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text(
                    "Veuillez inserer votre email et le nouveau mot de passe"),
                duration: Duration(seconds: 5),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            var db = new DatabaseHelper();
            db.reinitialiserPassword(email.trim(), password.trim());
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          }
        });
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(""),
      ),
      body: ListView(children: <Widget>[
        //padding: EdgeInsets.all(20.0),
        Column(
          children: <Widget>[
            Image.asset(logoImage),
            Text(
              'Nouveau mot de passe',
              style: TextStyle(fontSize: 20),
            ),
            Form(
              key: formKey,
              child: Column(children: <Widget>[
                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) => email = value,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: "Email Adresse")),
                TextFormField(
                  obscureText: true,
                  onSaved: (value) => password = value,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock), labelText: "mot de passe"),
                ),
              ]),
            ),
            RaisedButton(
                color: Colors.purpleAccent[100],
                child: Text("Reinitialiser le mot de passe"),
                onPressed: reinitialiser),
          ],
        ),
      ]),
    );
  }
}
