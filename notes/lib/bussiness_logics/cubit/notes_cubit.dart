
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/data/repository/repository.dart';
import 'package:notes/data/models/notes.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  final Repository repository;

  NotesCubit({required this.repository}) : super(NotesInitial());

  void fetchNotes() async {
    emit(NotesLoading());
    repository.fetchNotes().then((notes) {
      emit(NotesLoaded(notes: notes));
    });
  }

  void updateNoteList() {
    final currentState = state;
    if (currentState is NotesLoaded) {
      emit(NotesLoaded(notes: currentState.notes));
    }
  }

  void addNoteRefresh(Note note) {
    final currentState = state;
    if (currentState is NotesLoaded) {
      final noteList = currentState.notes;
      noteList.add(note);
      emit(NotesLoaded(notes: noteList));
    }
  }
}
