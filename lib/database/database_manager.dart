import 'package:flutter/cupertino.dart';
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

    getDatabasesPath().then((value) => {
      openDatabase(
        join(value, "data.db"),
        onOpen: (db) {
          return db.execute("CREATE TABLE IF NOT EXISTS Measurements (id INTEGER PRIMARY KEY, )");
        }
      ).then((value) {
        database = value;
        HAS_INSTANCE = true;
        INSTANCE = this;
      })
    });
  }


}