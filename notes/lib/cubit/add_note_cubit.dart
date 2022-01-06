import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes/cubit/notes_cubit.dart';
import 'package:notes/data/Services/repository.dart';
import 'package:notes/data/models/notes.dart';
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
