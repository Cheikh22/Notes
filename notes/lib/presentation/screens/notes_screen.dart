import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/constants/string.dart';
import 'package:notes/cubit/notes_cubit.dart';
import 'package:notes/data/models/notes.dart';
import 'package:path/path.dart';

class NotesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NotesCubit>(context).fetchNotes();

    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        backgroundColor: Colors.green[600],
      ),
      body: getNotesListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, ADD_NOTE_ROUTE),
        backgroundColor: Colors.greenAccent[700],
        child: const Icon(Icons.add),
      ),
    );
  }

  BlocBuilder getNotesListView() {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (!(state is NotesLoaded))
          return Center(child: CircularProgressIndicator());

        final notes = (state as NotesLoaded).notes;

        return Container(
          child: Card(
            child: Column(
              children: notes.map((e) => _noteList(e, context)).toList(),
            ),
          ),
        );
      },
    );
  }

  Widget _noteList(Note note, context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[300]!, // red as border color
        ),
      ),
      child: ListTile(
        title: Text(
          note.title!.toUpperCase(),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        subtitle: Text("${note.id!}"),
        trailing: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () async {},
        ),
        onTap: () async {},
      ),
    );
  }
}
