import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes/data/Services/repository.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {

  final Repository repository;

  NotesCubit({required this.repository}) : super(NotesInitial());

  void fetchNotes() async{
    repository.fetchNotes();
  }
}
