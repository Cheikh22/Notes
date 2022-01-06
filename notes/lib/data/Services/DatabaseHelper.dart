import 'dart:io';
import 'package:intl/intl.dart';
import 'package:notes/data/models/notes.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static Database? _database;
  static DatabaseHelper instance = DatabaseHelper._createInstance();

  DatabaseHelper._createInstance();

  static final _dbName = 'notes.db';
  static final _dbVersion = 1;
  static final _tableName = 'notes';

  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colDate = 'date';

  factory DatabaseHelper() {
    if (instance == null) {
      instance = DatabaseHelper._createInstance();
    }
    return instance;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initDatabase();
    }
    return _database!;
  }

  // open or create database
  _initDatabase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path, _dbName);
    return await openDatabase(dbPath,
        version: _dbVersion, onCreate: onCreateDB);
  }

  // create table
  onCreateDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        $colId INTEGER PRIMARY KEY AUTOINCREMENT,
        $colTitle TEXT NOT NULL,
        $colDescription TEXT NOT NULL,
        $colDate TEXT NOT NULL
      )
    ''');
  }

  // get all notes
  Future<List<Map<String, dynamic>>> getNotes() async {
    try {
      Database db = await instance.database;
      var list = await db.query(_tableName, orderBy: '$colDate DESC');
      return list;
    } catch (e) {
      return [];
    }
  }

// get Note by id
  Future<List<Map<String, dynamic>>> getNote(int id) async {
    try {
      Database db = await instance.database;
      var result =
          await db.query(_tableName, where: '$colId = ?', whereArgs: [id]);
      return result;
    } catch (e) {
      return [];
    }
  }

//insert a Note
  Future<List<Map<String, dynamic>>> insertNote(Note note) async {
    try {
      Database db = await instance.database;
      var result = await db.insert(_tableName, note.toJson());
      return getNote(result);
    } catch (e) {
      return [];
    }
  }

//update a Note
  Future<int> updateNote(Note note) async {
    try {
      Database db = await instance.database;
      var result = await db.update(_tableName, note.toJson(),
          where: '$colId =?', whereArgs: [note.id]);
      return result;
    } catch (e) {
      return 0;
    }
  }

// delete a Note
  Future<int> deleteNote(int id) async {
    Database db = await instance.database;
    var result =
        await db.delete(_tableName, where: '$colId =?', whereArgs: [id]);
    return result;
  }

  Future close() async {
    Database db = await instance.database;
    return db.close();
  }

  String Dateformatter() {
    var date = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy HH:mm');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }
}
