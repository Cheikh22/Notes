import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/constants/string.dart';
import 'package:notes/cubit/notes_cubit.dart';
import 'package:notes/data/Services/Services.dart';
import 'package:notes/data/Services/repository.dart';
import 'package:notes/presentation/screens/add_note_screen.dart';
import 'package:notes/presentation/screens/edit_note_screen.dart';
import 'package:notes/presentation/screens/notes_screen.dart';

class AppRouter {

  late Repository repository;

  AppRouter(){
    repository = Repository(services: Services());
  }

  Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case HOME_ROUTE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => NotesCubit(repository: repository),
            child: NotesList(),
          ),
        );
      case EDIT_NOTE_ROUTE:
        return MaterialPageRoute(builder: (_) => EditNote());
      case ADD_NOTE_ROUTE:
        return MaterialPageRoute(builder: (_) => AddNote());
      default:
        return null;
    }
  }
}
