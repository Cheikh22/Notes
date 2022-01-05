import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes/constants/string.dart';
import 'package:notes/cubit/add_note_cubit.dart';
import 'package:notes/data/models/notes.dart';
import 'package:path/path.dart';

class AddNote extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add note"),
        backgroundColor: Colors.green[600],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                _onSubmit(context);
              },
              child: Icon(
                Icons.check,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: addForm(),
    );
  }

  Padding addForm() {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, left: 1.0, right: 1.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            //date time text
            Padding(
              padding: EdgeInsets.only(left: 125.0, right: 20.0),
              child: Text(
                dateformatter(),
              ),
            ),
            // title textfield
            Padding(
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 0.0, left: 5.0, right: 5.0),
              child: TextFormField(
                autofocus: true,
                controller: titleController,
                onSaved: (val) => () {},
                validator: (val) =>
                    (val!.length <= 0 ? 'this field is required' : null),
                decoration: InputDecoration(
                  labelText: ' Title',
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16),
                  border: InputBorder.none,
                ),
              ),
            ),
            //description textfield
            Padding(
              padding: EdgeInsets.only(
                  top: 15.0, bottom: 15.0, left: 5.0, right: 1.0),
              child: TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Description',
                ),
                keyboardType: TextInputType.multiline,
                minLines: 26,
                maxLines: null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String dateformatter() {
    var date = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy HH:mm');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  _onSubmit(context) {
    var form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      String title = titleController.text;
      String description = descriptionController.text;
      titleController.clear();
      descriptionController.clear();
      BlocProvider.of<AddNoteCubit>(context).createNote(
          Note(title: title, description: description, date: dateformatter()));
      Navigator.pushNamedAndRemoveUntil(context, HOME_ROUTE, (route) => false);
    }
  }
}
