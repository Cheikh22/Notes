import 'package:notes/data/dataprovider/database_helper.dart';
import 'package:notes/data/models/notes.dart';

DatabaseHelper databaseHelper = DatabaseHelper();

class NetworkServices {
  Future<List<Map<String, dynamic>>> fetchNotes() async {
    var result = await databaseHelper.getNotes();
    return result;
  }

  addNote(Note note) async {
    await databaseHelper.insertNote(note);
  }

  void deleteNote(int idController) async {
    await databaseHelper.deleteNote(idController);
  }

  void updateNote(Note note) async{
    await databaseHelper.updateNote(note);
  }
}
