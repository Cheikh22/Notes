import 'package:notes/data/Services/DatabaseHelper.dart';
import 'package:notes/data/models/notes.dart';

DatabaseHelper databaseHelper = DatabaseHelper();

class Services {
  Future<List<Map<String, dynamic>>> fetchNotes() async {
    var result = await databaseHelper.getNotes();
    return result;
  }

  addNote(Note note) async {
    await databaseHelper.InsertNote(note);
  }
}
