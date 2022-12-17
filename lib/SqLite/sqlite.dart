import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:paie_arbitre/Models/dropdownModel.dart';
import 'package:paie_arbitre/Models/match.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;

class Sqlite {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""
      CREATE TABLE Mois(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nom TEXT NOT NULL
      );
      """);
    await database.execute("""INSERT INTO Mois (nom)
      VALUES ("Janvier"), ("Février"), ("Mars"), ("Avril"), ("Mai"), ("Juin"), ("Juillet"), ("Août"), ("Septembre"), ("Octobre"), ("Novembre"), ("Décembre");
      """);

    await database.execute("""CREATE TABLE Categories(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nom TEXT NOT NULL,
        tarif INTEGER NOT NULL
      );
      """);
    await database.execute("""INSERT INTO Categories (nom, tarif)
      VALUES ("Atome", 27), ("Peewee", 30), ("Bantam", 33), ("Midget", 36), ("Junior", 55);
      """);

    await database.execute("""CREATE TABLE Postes(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nom TEXT NOT NULL,
        montantligne INTEGER NOT NULL
      );
      """);
    await database.execute("""INSERT INTO Postes (nom, montantligne)
      VALUES ("À deux", 0), ("Charge", 0), ("Ligne", 10);
      """);
    await database.execute("""CREATE TABLE Villes(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nom TEXT NOT NULL,
        tarif INTEGER NOT NULL
      );
      """);
    await database.execute("""INSERT INTO Villes (nom, tarif)
      VALUES ("Warwick", 5), ("Kingsey Falls", 20), ("Val-des-Sources", 35);
      """);
    await database.execute("""CREATE TABLE Paies(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        date TEXT NOT NULL,
        mois INTEGER NOT NULL,
        montant DOUBLE NOT NULL,
        FOREIGN KEY (mois) REFERENCES Mois(id)
      );
      """);

    await database.execute("""CREATE TABLE Matchs(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        date TEXT NOT NULL,
        ville INTEGER NOT NULL,
        numeromatch INTEGER NOT NULL,
        categorie INTEGER NOT NULL,
        heure TEXT NOT NULL,
        poste INTEGER NOT NULL,
        mois INTEGER NOT NULL,
        tarif INTEGER NOT NULL,
        FOREIGN KEY (mois) REFERENCES Mois(id),
        FOREIGN KEY (ville) REFERENCES Villes(id),
        FOREIGN KEY (categorie) REFERENCES Categories(id),
        FOREIGN KEY (poste) REFERENCES Poste(id)
      );
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      join(await sql.getDatabasesPath(), 'paieArbitre.db'),
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  //Select tous les mois
  static Future<List<DropdownModel>> getMois() async {
    final db = await Sqlite.db();

    final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * from Mois");

    return List.generate(maps.length, (i) {
      return DropdownModel(
          id: maps[i]['id'],
          nom: maps[i]['nom']
      );
    });
  }

  //Select toutes les categories
  static Future<List<DropdownModel>> getCategories() async {
    final db = await Sqlite.db();

    final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Categories");

    return List.generate(maps.length, (i) {
      return DropdownModel(
          id: maps[i]['id'],
          nom: maps[i]['nom']
      );
    });
  }

  //Select toutes les villes
  static Future<List<DropdownModel>> getVilles() async {
    final db = await Sqlite.db();

    final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Villes");

    return List.generate(maps.length, (i) {
      return DropdownModel(
          id: maps[i]['id'],
          nom: maps[i]['nom']
      );
    });
  }

  //Select tous les postes
  static Future<List<DropdownModel>> getPostes() async {
    final db = await Sqlite.db();

    final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Postes");

    return List.generate(maps.length, (i) {
      return DropdownModel(
          id: maps[i]['id'],
          nom: maps[i]['nom']
      );
    });
  }

  //Select tous les matchs
  static Future<List<MatchModel>> getMatch(int mois) async {
    final db = await Sqlite.db();
    final List<Map<String, dynamic>> maps;

    if (mois == 0){
      maps = await db.rawQuery("SELECT Matchs.id, date, numeromatch, heure, Villes.nom AS villenom, Categories.nom AS categorienom, Postes.nom AS postenom, Matchs.tarif FROM Matchs INNER JOIN Villes ON Villes.id = Matchs.ville INNER JOIN Categories ON Categories.id = Matchs.categorie INNER JOIN Postes ON Postes.id = Matchs.poste");
    }
    else{
      maps = await db.rawQuery("SELECT Matchs.id, date, numeromatch, heure, Villes.nom AS villenom, Categories.nom AS categorienom, Postes.nom AS postenom, Matchs.tarif FROM Matchs INNER JOIN Villes ON Villes.id = Matchs.ville INNER JOIN Categories ON Categories.id = Matchs.categorie INNER JOIN Postes ON Postes.id = Matchs.poste WHERE Matchs.mois = ?", [mois]);
    }

    return List.generate(maps.length, (i) {
      return MatchModel(
          id: maps[i]['id'],
          date: maps[i]["date"],
          ville: maps[i]["villenom"],
          numeromatch: maps[i]['numeromatch'],
          categorie: maps[i]["categorienom"],
          heure: maps[i]["heure"],
          poste: maps[i]["postenom"],
          tarif: maps[i]["tarif"]
      );
    });
  }

  //Select toutes les montants dut
  static Future<int> getMontanDut(String mois) async {
    final db = await Sqlite.db();
    final List<Map<String, dynamic>> maps;
    int moisBD;

    if (mois == ""){
       moisBD = 0;
    }
    else{
       moisBD = int.parse(mois);
    }

    if (moisBD == 0 ){
      maps = await db.rawQuery("SELECT IFNULL(SUM(tarif), 0) AS montant FROM Matchs");
    }
    else {
      maps = await db.rawQuery("SELECT IFNULL(SUM(tarif), 0) AS montant FROM Matchs WHERE mois = ?", [moisBD]);
    }

    return maps[0]["montant"];
  }

  //Select toutes les montants reçu
  static Future<double> getMontanRecu(int mois) async {
    final db = await Sqlite.db();
    final List<Map<String, dynamic>> maps;

    if (mois == 0 ){
      maps = await db.rawQuery("SELECT IFNULL(SUM(montant), 0.0) AS montant FROM Paies");
    }
    else {
      maps = await db.rawQuery("SELECT IFNULL(SUM(montant), 0.0) AS montant FROM Paies WHERE mois = ?", [mois]);
    }

    return maps[0]["montant"];
  }

  //Insert
  static void createMatch(String date, int ville, int numeroMatch, int categorie, String heure, int poste, int tarif) async {
    final db = await Sqlite.db();

    final int mois = int.parse(date.substring(5, 7));

    final data = {'date': date, 'ville': ville, "numeromatch": numeroMatch, "categorie": categorie,
    "heure": heure, "poste": poste, "tarif": tarif, "mois": mois};

    await db.insert('Matchs', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  //Insert
  static void createPaie(double montant, String date) async {
    final db = await Sqlite.db();

    final int mois = int.parse(date.substring(5, 7));
    final data = {'date': date,"montant": montant, "mois": mois};

    await db.insert('Paies', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  //Update
  static Future<int> updateMatch(int id, String date, int numeroMatch, String heure) async {
    final db = await Sqlite.db();

    final int mois = int.parse(date.substring(5, 7));

    final data = {'date': date, "numeromatch": numeroMatch, "heure": heure, "mois": mois};

    final result =
    await db.update('Matchs', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  //Delete
  static Future<void> deleteMatch(int id) async {
    final db = await Sqlite.db();
    try {
      await db.delete("Matchs", where: 'id=?', whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}