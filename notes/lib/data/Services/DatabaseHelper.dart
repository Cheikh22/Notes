import 'dart:io';
import 'package:notes/data/models/notes.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper{
  static const _databaseName = 'notes.db';
  static const _databaseVersion = 1;

  DatabaseHelper._();

  static final DatabaseHelper instance =DatabaseHelper._();
  Database? _database;
  Future <Database?> get database async{
    if(_database != null) return _database;
    _database = await _initDatabase();
    return _database;

  }

  _initDatabase() async{
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path, _databaseName);
    return await openDatabase(dbPath,version:_databaseVersion,onCreate:onCreateDB);
  }
  onCreateDB(Database db,int version) async{
    await db.execute('''
      CREATE TABLE IF NOT EXISTS notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
      )
    ''');
  }
  Future<int> InsertNote(Note note) async{
    Database? db = await database;
    return await db!.insert('notes', note.toJson());
  }

  Future<List<Note>> fetchNotes() async {
    Database? db = await database;
    List<Map<String, dynamic>> notes = await db!.query('notes');
    return notes.length == 0 ?[] : notes.map((e) => Note.fromJson(e)).toList();
  }

}