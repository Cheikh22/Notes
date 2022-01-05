part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}
class AddingNote extends AddNoteState{}
class NoteAdded extends AddNoteState{}