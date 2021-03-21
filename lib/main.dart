import 'package:IrisApps/constants.dart';
import 'package:IrisApps/screens/authentification/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:splashscreen/splashscreen.dart';
// import 'package:splashscreen/splashscreen.dart';
// import 'constants.dart';
// import 'screens/login_screen.dart';

void main() =>
    initializeDateFormatting('fr_FR', null).then((_) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'appTitle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash2(),
    );
  }
}

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: appTitle,
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: Splash2(),
//       // home: HomeScreen()
//     );
//   }
// }

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new LoginScreen(),
      title: new Text(
        appTitle,
        
        textScaleFactor: 2,
      ),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor:  Colors.blue.shade300,
    );
  }
}

class MyLogin extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue.shade300),
      home: LoginScreen(),
    );
  }
}
