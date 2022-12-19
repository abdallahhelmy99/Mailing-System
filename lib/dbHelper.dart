// ignore_for_file: unused_label

import 'dart:ffi';

import 'package:mailing_system/Classes/User.dart';
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
    await db.execute('CREATE TABLE "Users" (userID INTEGER PRIMARY KEY AUTOINCREMENT, fname TEXT NOT NULL, lname TEXT NOT NULL,  dob DATETIME, email TEXT NOT NULL, password TEXT NOT NULL, phonenum TEXT NOT NULL)');
    //await db.execute('CREATE TABLE "Contacts" (contact_ID INTEGER PRIMARY KEY AUTOINCREMENT,contactname TEXT NOT NULL , contactemail TEXT NOT NULL,  phonenum TEXT NOT NULL, relation TEXT NOT NULL )');
    //await db.execute('CREATE TABLE "CONTACT_USER_RELATION" (userID INTEGER FOREIGN KEY AUTOINCREMENT, contact_ID INTEGER FOREIGN KEY AUTOINCREMENT,)');
    // await db.execute('CREATE TABLE "Mail" (emailID INTEGER PRIMARY KEY AUTOINCREMENT, subject TEXT NOT NULL, body TEXT NOT NULL, trash Boolean, important Boolean , spam Boolean , isRead Boolean, date DATETIME)');
    // await db.execute('CREATE TABLE "GROUP"(groupname TEXT NOT NULL, userID INTEGER AUTOINCREMENT, groupID INTEGER PRIMARY KEY AUTOINCREMENT)');
    // await db.execute('CREATE TABLE "GroupContent"(userID INTEGER AUTOINCREMENT, groupID INTEGER PRIMARY KEY AUTOINCREMENT, groupname TEXT NOT NULL, email TEXT NOT NULL, emailID INTEGER AUTOINCREMENT )');

    // Autoincrement lazem tkon m3 primary key , foreign key feha mashakel
  }

  initialDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'Mail_SystemDatabase.db');
    Database myDB = await openDatabase(path, onCreate: _onCR, version: 1);
    return myDB;
  }

  Future<List<User>> readUsers() async {
    Database? mydb = await db;
    List<Map<String, dynamic>> response =
        await mydb!.rawQuery("SELECT * FROM Users");
    return List.generate(response.length, (i) {
      return User(
        fname: response[i]['fname'],
        lname: response[i]['lname'],
        phoneNo: response[i]['phoneNo'],
        dob: response[i]['dob'],
        email: response[i]['email'],
        password: response[i]['password'],
      );
    });
  }

  Future<List<Map>> readUnDoneTasks() async {
    Database? mydb = await db;
    List<Map> response =
        await mydb!.rawQuery("SELECT * FROM Users");
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
    int response = await mydb!.rawDelete('DROP TABLE Users');
  }

  Future<int> updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }
}
