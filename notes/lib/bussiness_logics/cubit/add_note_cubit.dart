import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/data/repository/repository.dart';
import 'package:notes/data/models/notes.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  final Repository repository;

  AddNoteCubit({required this.repository}) : super(AddNoteInitial());

  void createNote(Note note) {
    emit(AddNoteLoading());
    try {
      repository.addNote(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteError(msg: "Veuillez reesayer"));
    }
  }
}
