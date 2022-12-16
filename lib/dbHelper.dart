// ignore_for_file: unused_label

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class dbHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else {
      return _db;
    }
  }

  _onCR(Database db, int v) async {
    await db.execute(
        'CREATE TABLE "Tasks" (id INTEGER PRIMARY KEY AUTOINCREMENT, task TEXT NOT NULL, date TEXT, done TEXT NOT NULL)');
  }

  initialDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'tasks.db');
    Database myDB = await openDatabase(path, onCreate: _onCR, version: 1);
    return myDB;
  }

  Future<List<Map>> readDoneTasks() async {
    Database? mydb = await db;
    List<Map> response =
        await mydb!.rawQuery("SELECT * FROM Tasks WHERE done = 'true'");
    return response;
  }

  Future<List<Map>> readUnDoneTasks() async {
    Database? mydb = await db;
    List<Map> response =
        await mydb!.rawQuery("SELECT * FROM Tasks WHERE done = 'false'");
    return response;
  }

  Future<int> insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  Future<int> deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  deleteDatabase() async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete('DROP Tasks');
  }

  Future<int> updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }
}
