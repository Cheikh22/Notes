import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/presentations/constants/string.dart';
import 'package:notes/bussiness_logics/cubit/add_note_cubit.dart';
import 'package:notes/bussiness_logics/cubit/edit_note_cubit.dart';
import 'package:notes/bussiness_logics/cubit/notes_cubit.dart';
import 'package:notes/data/dataprovider/network_services.dart';
import 'package:notes/data/repository/repository.dart';
import 'package:notes/data/models/notes.dart';
import 'package:notes/presentations/screens/Splash/splash.dart';
import 'package:notes/presentations/screens/notes/add_note_screen.dart';
import 'package:notes/presentations/screens/notes/edit_note_screen.dart';
import 'package:notes/presentations/screens/notes/notes_screen.dart';

class AppRouter {
  late Repository repository;
  late NotesCubit notesCubit;

  AppRouter() {
    repository = Repository(services: Services());
    notesCubit = NotesCubit(repository: repository);
  }

  Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
        
      case homePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: notesCubit,
            child: const NotesList(),
          ),
        );

      case editNote:
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
        
      case addNote:
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
