import 'package:notes/data/Services/Services.dart';
import 'package:notes/data/models/notes.dart';

class Repository{
  
   final Services services;

  Repository({required this.services});

  Future<List<dynamic>>? fetchNotes() {

    services.fetchNotes();
  }
  
}