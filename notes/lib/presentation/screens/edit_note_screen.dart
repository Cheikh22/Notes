import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes/presentation/constants/string.dart';
import 'package:notes/cubit/edit_note_cubit.dart';
import 'package:notes/data/models/notes.dart';

class EditNote extends StatelessWidget {
  final Note note;
  EditNote({Key? key, required this.note}) : super(key: key);

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String date_edit = '';
  int idController = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    titleController.text = this.note.title!;
    descriptionController.text = this.note.description!;
    date_edit = this.note.date!;
    idController = this.note.id!;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit note"),
        backgroundColor: primaryDarkColor,
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
                showDialog(
                  context: context,
                  builder: (BuildContext contextAlert) => AlertDialog(
                    title:
                        Text('Delete'), // To display the title it is optional
                    content: Text(
                        'Do you want to delete ?'), // Message which will be pop up on the screen
                    // Action widget which will provide the user to acknowledge the choice
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(
                            // FlatButton widget is used to make a text to work like a button
                            textColor: Colors.black,
                            onPressed: () {
                              Navigator.pop(context);
                            }, // function used to perform after pressing the button
                            child: Text('CANCEL'),
                          ),
                          FlatButton(
                            textColor: Colors.black,
                            onPressed: () {
                              BlocProvider.of<EditNoteCubit>(context)
                                  .deleteNote(idController);
                              Navigator.pushNamedAndRemoveUntil(
                                  context, HOME_ROUTE, (route) => false);
                            },
                            child: Text('ACCEPT'),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
              child: Icon(
                Icons.delete,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: editForm(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onEditNote(context);
        },
        backgroundColor: Colors.greenAccent,
        child: const Icon(Icons.check),
      ),
    );
  }

  Padding editForm() {
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
                note.date!,
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

  _onEditNote(context) {
    var form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      String title = titleController.text;
      String description = descriptionController.text;
      int id = idController;
      BlocProvider.of<EditNoteCubit>(context).updateNote(
        Note(
          id: idController,
          title: title,
          description: description,
          date: dateformatter(),
        ),
      );
      Navigator.pushNamedAndRemoveUntil(context, HOME_ROUTE, (route) => false);
    }
  }

  String dateformatter() {
    var date = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy HH:mm');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }
}
