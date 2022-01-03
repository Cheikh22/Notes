import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/constants/string.dart';
import 'package:notes/cubit/notes_cubit.dart';
import 'package:path/path.dart';

class NotesList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

  BlocProvider.of<NotesCubit>(context).fetchNotes();

    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text("list of notes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, ADD_NOTE_ROUTE),
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
    );
  }
}
