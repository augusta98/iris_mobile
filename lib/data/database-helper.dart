import 'package:IrisApps/models/anciens/Detenteur-models.dart';
import 'package:IrisApps/models/anciens/Entretien_models.dart';
import 'package:IrisApps/models/anciens/mecanicien_models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final databaseName = "mocar.db";
  static final databaseVersion = 1;

  static final tableDetenteurVoiture = "detenteur";

  static final columnDetenteurId = "id";
  static final columnDetenteurNom = "nom";
  static final columnDetenteurPrenom = "prenom";
  static final columnDetenteurEmail = "email";
  static final columnDetenteurPassword = "password";

  static final tableMecanicien = "mecanicien";

  static final columnMecanicienId = "id";
  static final columnMecanicienNom = "nommecanicien";
  static final columnMecanicienPrenom = "prenommecanicien";
  static final columnMecanicienImage = "imageUrl";
  static final columnMecanicienPhone = "phone";
  static final columnMecanicienVille = "ville";
  static final columnMecanicienHeureOuverture = "heureouverture";
  static final columnMecanicienHeureFermerture = "heurefermeture";
  static final columnMecanicienSpecialite = "specialite";
  static final columnMecanicienPrice = "price";
  static final columnMecanicienRating = "rating";

  static final tableEntretiens = 'Entretiens';

  static final columnId = 'id';
  static final columnDateRDV = 'DateRDV';
  //Ceci fait qu'il y aura qu une seule instance de DatabaseHelper dans l'application
  //pour eviter des conflits lors de l'acces à  la base de donnees.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance =
      new DatabaseHelper._privateConstructor();
  factory DatabaseHelper() => instance;

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), databaseName);
    return await openDatabase(path,
        version: databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableDetenteurVoiture (
            $columnDetenteurId INTEGER PRIMARY KEY AUTOINCREMENT, 
            $columnDetenteurNom TEXT,
            $columnDetenteurPrenom TEXT,
            $columnDetenteurEmail TEXT,
            $columnDetenteurPassword TEXT
          )
          ''');

    await db.execute('''
          CREATE TABLE $tableMecanicien (
            $columnMecanicienId INTEGER PRIMARY KEY AUTOINCREMENT, 
            $columnMecanicienNom TEXT,
            $columnMecanicienPrenom  TEXT,
            $columnMecanicienImage  TEXT,
            $columnMecanicienPhone TEXT,
            $columnMecanicienVille  TEXT,
            $columnMecanicienHeureOuverture   TEXT,
            $columnMecanicienHeureFermerture   TEXT,
            $columnMecanicienSpecialite  TEXT,
            $columnMecanicienPrice    INTEGER,
            $columnMecanicienRating    INTEGER
          )
          ''');

    await db.execute('''
          CREATE TABLE $tableEntretiens (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT, 
            $columnDateRDV TEXT
          )
          ''');
    print("Table is created");
  }

  // Enregistrement d'un nouveau utilisateur
  Future<int> sauvegarderUtilisateur(Detenteur detenteur) async {
    var dbClient = await database;
    print(detenteur.nom);
    int response =
        await dbClient.insert(tableDetenteurVoiture, detenteur.toMap());
    List<Map> list =
        await dbClient.rawQuery('SELECT * FROM $tableDetenteurVoiture');
    print(list);
    return response;
  }

  //Verification du email et mot de passe
  Future<bool> verifierUtilisateur(String email, String password) async {
    var dbClient = await database;
    int countUtilisateur = Sqflite.firstIntValue(await dbClient.rawQuery(
        "SELECT COUNT(*) FROM $tableDetenteurVoiture where $columnDetenteurEmail = '$email' and $columnDetenteurPassword = '$password'"));
    if (countUtilisateur <= 0) {
      return false;
    } else {
      return true;
    }
  }

  void reinitialiserPassword(String email, String nouveauPassword) async {
    var dbClient = await database;
    // Champs a mettre a jour
    Map<String, dynamic> row = {columnDetenteurPassword: nouveauPassword};

    await dbClient.update(tableDetenteurVoiture, row,
        where: '$columnDetenteurEmail = ?', whereArgs: [email]);

    print(await dbClient.query(tableDetenteurVoiture));
  }

  Future<List<Mecanicien>> getlistMecanicien() async {
    var dbClient = await database;
    Mecanicien mecanicien = new Mecanicien(
        nommecanicien: "Augusta",
        prenommecanicien: "Sik",
        heureFermeture: "09:00 a.m",
        heureOuverture: "05:00 a.m",
        imageUrl: "https://i.ibb.co/54Qm61J/venice.jpg",
        phone: "54762",
        price: 1200,
        rating: 4,
        specialite: "Pneu",
        ville: "Rose Hill");

    await dbClient.insert(tableMecanicien, mecanicien.toMap());
    List<Map> maps = await dbClient.rawQuery('SELECT * FROM $tableMecanicien');
    print("Maps: $maps");
    return List.generate(maps.length, (i) {
      return Mecanicien(
        heureFermeture: maps[i]["heureFermeture"],
        heureOuverture: maps[i]["heureOuverture"],
        imageUrl: maps[i]["imageUrl"],
        nommecanicien: maps[i]["nommecanicien"],
        phone: maps[i]["phone"],
        prenommecanicien: maps[i]["prenommecanicien"],
        price: maps[i]["price"],
        rating: maps[i]["rating"],
        specialite: maps[i]["specialite"],
        ville: maps[i]["ville"],
      );
    });
  }

  Future<int> ajouterRdv(RendezVous entretiens) async {
    Database db = await instance.database;
    var res = await db.insert(tableEntretiens, entretiens.toMap());
    return res;
  }

  Future<List<Map<String, dynamic>>> recupererRdv() async {
    Database db = await instance.database;
    var res = await db.query(tableEntretiens, orderBy: "$columnId DESC");
    return res;
  }
}
