import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/presentations/constants/constants.dart';
import 'package:notes/presentations/constants/string.dart';
import 'package:notes/bussiness_logics/cubit/notes_cubit.dart';
import 'package:notes/data/models/notes.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NotesCubit>(context).fetchNotes();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: getNotesListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, addNote),
        backgroundColor: primaryDarkColor,
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
          child: SingleChildScrollView(
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
      child: Column(
        children: [
          ListTile(
            title: Text(
              note.title!.toUpperCase(),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            subtitle: description(note.description!),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () async {
                Navigator.pushNamed(context, editNote, arguments: note);
              },
            ),
            onTap: () async {
              Navigator.pushNamed(context, editNote, arguments: note);
            },
          ),
          Divider(
            height: 5.0,
          ),
        ],
      ),
    );
  }

  Widget description(String text) {
    if (text.length > 35) {
      return Text('${(text).substring(0, 34)}...');
    } else {
      return Text(text);
    }
  }
}
