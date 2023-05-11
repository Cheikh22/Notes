import 'package:notes/data/dataprovider/network_services.dart';
import 'package:notes/data/models/notes.dart';

class Repository {
  final NetworkServices services;

  Repository({required this.services});

  Future<List<Note>> fetchNotes() async {
    var items = await services.fetchNotes();
    return items.map<Note>((e) => Note.fromJson(e)).toList();
  }

  Future<Note?> addNote(Note note) async {
    final notes = await services.addNote(note);
    if (notes == null) return null;
    return notes.map<Note>((e) => Note.fromJson(e)).toList();
  }

  void deleteNote(int idController) {
    services.deleteNote(idController);
  }

  void updateNote(Note note) {
    services.updateNote(note);
  }
}
