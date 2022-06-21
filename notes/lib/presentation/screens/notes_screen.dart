import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_version/new_version.dart';
import 'package:notes/presentation/constants/string.dart';
import 'package:notes/cubit/notes_cubit.dart';
import 'package:notes/data/models/notes.dart';

class NotesList extends StatefulWidget {
  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {

  
  void _checkVersion() async {
    final newVersion = NewVersion(
      iOSId: 'mr.digi.sedad',
      androidId: "mr.digi.sedad",
    );
      final status = await newVersion.getVersionStatus();
      if (status!.canUpdate ==true)
        newVersion.showUpdateDialog(
          context: context,
          versionStatus: status,
          allowDismissal: false,
          dialogTitle:   "update!",
          dismissButtonText:   "ignorer",
          dialogText:   "please update",
          dismissAction: () {
            SystemNavigator.pop();
          },
          updateButtonText: "lets update",
        );

      print("DEVICE : " + status.localVersion);
      print("STORE : " + status.storeVersion);
  }

  @override
  void initState() {
    super.initState();
     _checkVersion();
  }

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
        onPressed: () => Navigator.pushNamed(context, ADD_NOTE_ROUTE),
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
                Navigator.pushNamed(context, EDIT_NOTE_ROUTE, arguments: note);
              },
            ),
            onTap: () async {
              Navigator.pushNamed(context, EDIT_NOTE_ROUTE, arguments: note);
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
      return Text((text).substring(0, 34) + '...');
    } else {
      return Text(text);
    }
  }
}
