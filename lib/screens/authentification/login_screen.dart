import 'package:IrisApps/data/database-helper.dart';
import 'package:IrisApps/screens/home/Home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';
import 'register_screen.dart';
import 'forget_screen.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String email, password;

  void submit() {
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
              content: Text("Veuillez inserer votre email et mot de passe"),
              duration: Duration(seconds: 5),
              backgroundColor: Colors.red,
            ),
          );
        } else {
          var db = new DatabaseHelper();
          db.verifierUtilisateur(email.trim(), password.trim()).then((valide) {
            print(valide);
            if (identical(valide, true)) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            } else {
              _scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content: Text("Email ou mot de passe invalide"),
                  duration: Duration(seconds: 5),
                  backgroundColor: Colors.red,
                ),
              );
            }
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(""),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
            //padding: EdgeInsets.all(20.0),
            Container(
                 height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin:Alignment.topCenter,
                  end:Alignment.bottomCenter, 
                  colors: [
                    Color(0xFFE3F2D),
                    Color(0xFFE3F2D),
                    Color(0xFFE3F2D),
                    Color(0xFFE3F2D)],
                    ),
                ),child :Column(
                Image.asset(logoImage),
                Text(
                  'BIENVENU(E)S A $appTitle',
                  style: TextStyle(
                      fontSize: (20),
                      fontFamily: 'Poppins-Bold',
                      letterSpacing: 2),
                ),
                Form(
                  key: formKey,
                  child: Column(children: <Widget>[
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) => email = value,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: "Email Adresse")),
                    TextFormField(
                      obscureText: true,
                      onSaved: (value) => password = value,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: "mot de passe"),
                    ),
                  ]),
                ),
                RaisedButton(
                    color: Colors.blue.shade300,
                    child: Text("Se connecter"),
                    onPressed: submit),
                FlatButton(
                    child: Text("S'enregistrer"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    }),
                FlatButton(
                    child: Text("Mot de passe oublier?"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetScreen()));
                    ),    }),
              ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
