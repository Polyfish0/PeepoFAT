import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:peepofat/stats/body_measurement.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseManager {
  static bool HAS_INSTANCE = false;
  static DatabaseManager? INSTANCE;
  late Database database;

  DatabaseManager() {
    if(HAS_INSTANCE) {
      return;
    }

    WidgetsFlutterBinding.ensureInitialized();

    getDatabasesPath().then((value) {
      openDatabase(
        join(value, "data.db"),
        onCreate: (db, version) {
          db.execute("CREATE TABLE Profiles (id INTEGER PRIMARY KEY, age INTEGER, size INTEGER, male BOOLEAN)");
          return db.execute("CREATE TABLE Measurements (id INTEGER PRIMARY KEY, uid INTEGER, date DATETIME, weight INTEGER, impedance INTEGER, bodyFat DOUBLE, visceralFat DOUBLE, boneMass DOUBLE, water DOUBLE, muscleMass DOUBLE, bmi DOUBLE, lbmCoefficient DOUBLE)");
        },
        version: 1
      ).then((value) {
        database = value;
        HAS_INSTANCE = true;
        INSTANCE = this;
      });
    });
  }

  Future<void> insertBodyMeasurement(BodyMeasurement measurement) async {
    await database.insert("Measurements", measurement.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<BodyMeasurement>> getBodyMeasurements() async {
    final List<Map<String, dynamic>> maps = await database.query("Measurements");
    return List.generate(maps.length, (i) {
      return BodyMeasurement(id: maps[i]["id"], uid: maps[i]["uid"], date: maps[i]["date"], weight: maps[i]["weight"], impedance: maps[i]["impedance"], bodyFat: maps[i]["bodyFat"], visceralFat: maps[i]["visceralFat"], boneMass: maps[i]["boneMass"], water: maps[i]["water"], muscleMass: maps[i]["muscleMass"], bmi: maps[i]["bmi"], lbmCoefficient: maps[i]["lbmCoefficient"]);
    });
  }
}