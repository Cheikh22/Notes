import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes/cubit/notes_cubit.dart';
import 'package:notes/data/Services/repository.dart';
import 'package:notes/data/models/notes.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  final Repository repository;
  final NotesCubit notesCubit;

  EditNoteCubit({required this.repository, required this.notesCubit})
      : super(EditNoteInitial());

  void deleteNote(int idController) {
    repository.deleteNote(idController);
  }

  void updateNote(Note note,) {
    repository.updateNote(note);
  }
}
