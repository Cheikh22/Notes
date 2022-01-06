import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/constants/string.dart';
import 'package:notes/cubit/add_note_cubit.dart';
import 'package:notes/cubit/edit_note_cubit.dart';
import 'package:notes/cubit/notes_cubit.dart';
import 'package:notes/data/Services/Services.dart';
import 'package:notes/data/Services/repository.dart';
import 'package:notes/data/models/notes.dart';
import 'package:notes/presentation/screens/add_note_screen.dart';
import 'package:notes/presentation/screens/edit_note_screen.dart';
import 'package:notes/presentation/screens/notes_screen.dart';

class AppRouter {
  late Repository repository;
  late NotesCubit notesCubit;

  AppRouter() {
    repository = Repository(services: Services());
    notesCubit = NotesCubit(repository: repository);
  }

  Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case HOME_ROUTE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: notesCubit,
            child: NotesList(),
          ),
        );

      case EDIT_NOTE_ROUTE:
        final note = setting.arguments as Note;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => EditNoteCubit(
              repository: repository,
              notesCubit: notesCubit,
            ),
            child: EditNote(
              note: note,
            ),
          ),
        );
        
      case ADD_NOTE_ROUTE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => AddNoteCubit(
              repository: repository,
              notesCubit: notesCubit,
            ),
            child: AddNote(),
          ),
        );
      default:
        return null;
    }
  }
}
