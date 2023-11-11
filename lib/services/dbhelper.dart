import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static const dbName = "mydatabase.db";
  static const dbVersion = 1;
  static const dbTable = "myTable";
  static const columnId = 'id';
  static const columnName = 'name';

  static final DbHelper instance = DbHelper();

  // initialise

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initdb();
    return _database;
  }

  initdb() async {
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      String path = join(directory.path, dbName);
      return await openDatabase(path, version: dbVersion, onCreate: onCreate);
    } catch (e) {
      print("Error initializing database: $e");
      return null;
    }
  }

  Future onCreate(Database db, int version) async {
    db.execute('''
CREATE TABLE $dbTable(
  $columnId INTEGER PRIMARY KEY,
  $columnName TEXT NOT NULL
)
''');
  }

  insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db?.insert(dbTable, row);
  }

  Future<List<Map<String, dynamic>>> queryDatabse() async {
    Database? db = await instance.database;
    return await db!.query(dbTable);
  }
}
