import 'dart:convert';

import 'package:notes/data/Services/Services.dart';
import 'package:notes/data/models/notes.dart';

class Repository {
  final Services services;

  Repository({required this.services});

  Future<List<Note>> fetchNotes() async {
    var items = await services.fetchNotes();
    return items.map<Note>((e) => Note.fromJson(e)).toList();
  }

  Future<Note?> addNote(Note note) async {
    final _note = await services.addNote(note);
    if (_note == null) return null;
    return _note.map<Note>((e) => Note.fromJson(e)).toList();
  }
}
