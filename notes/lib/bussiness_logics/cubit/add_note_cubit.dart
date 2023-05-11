
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/data/repository/repository.dart';
import 'package:notes/data/models/notes.dart';

import 'notes_cubit.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  final Repository repository;
  final NotesCubit notesCubit;

  AddNoteCubit({required this.repository, required this.notesCubit})
      : super(AddNoteInitial());

  void createNote(Note note) {
    emit(AddingNote());
    repository.addNote(note).then((note) {
      if (note != null) {
        notesCubit.addNoteRefresh(note);
        emit(NoteAdded());
      }
    });
  }
}
