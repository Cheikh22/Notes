import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/data/services.dart';
import 'package:notes/presentations/components/default_button.dart';
import 'package:notes/presentations/components/showToast.dart';
import 'package:notes/presentations/components/spiner.dart';
import 'package:notes/presentations/components/text_form_field.dart';
import 'package:notes/presentations/constants/constants.dart';
import 'package:notes/presentations/constants/size_config.dart';
import 'package:notes/presentations/constants/string.dart';
import 'package:notes/bussiness_logics/cubit/add_note_cubit.dart';
import 'package:notes/data/models/notes.dart';

// class AddNote extends StatelessWidget {
//   TextEditingController titleController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Add note"),
//         backgroundColor: primaryDarkColor,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back_ios),
//         ),
//         actions: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(right: 20.0),
//             child: GestureDetector(
//               onTap: () {
//                 _onAddNote(context);
//               },
//               child: Icon(
//                 Icons.check,
//                 size: 26.0,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: addForm(),
//     );
//   }

//   Padding addForm() {
//     return Padding(
//       padding: EdgeInsets.only(top: 10.0, left: 1.0, right: 1.0),
//       child: Form(
//         key: _formKey,
//         child: ListView(
//           children: <Widget>[
//             //date time text
//             Padding(
//               padding: EdgeInsets.only(left: 125.0, right: 20.0),
//               child: Text(
//                 dateformatter(),
//               ),
//             ),
//             // title textfield
//             Padding(
//               padding: EdgeInsets.only(
//                   top: 10.0, bottom: 0.0, left: 5.0, right: 5.0),
//               child: TextFormField(
//                 autofocus: true,
//                 controller: titleController,
//                 onSaved: (val) => () {},
//                 validator: (val) =>
//                     (val!.length <= 0 ? 'this field is required' : null),
//                 decoration: InputDecoration(
//                   labelText: ' Title',
//                   labelStyle: const TextStyle(
//                       fontWeight: FontWeight.w500, fontSize: 16),
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//             //description textfield
//             Padding(
//               padding: EdgeInsets.only(
//                   top: 15.0, bottom: 15.0, left: 5.0, right: 1.0),
//               child: TextFormField(
//                 controller: descriptionController,
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: 'Description',
//                 ),
//                 keyboardType: TextInputType.multiline,
//                 minLines: 26,
//                 maxLines: null,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   String dateformatter() {
//     var date = DateTime.now();
//     var formatter = DateFormat('dd-MM-yyyy HH:mm');
//     String formattedDate = formatter.format(date);
//     return formattedDate;
//   }

//   _onAddNote(context) {
//     var form = _formKey.currentState;
//     if (form!.validate()) {
//       form.save();
//       String title = titleController.text;
//       String description = descriptionController.text;
//       BlocProvider.of<AddNoteCubit>(context).createNote(
//           Note(title: title, description: description, date: dateformatter()));
//       Navigator.pushNamedAndRemoveUntil(context, homePage, (route) => false);
//     }
//   }
// }

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  String? note;
  String? description;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kgrey200,
      appBar: AppBar(
        title: Text(
          "Notes",
          textScaleFactor: 1.0,
          style: textstyle.copyWith(
              color: whitecolor,
              fontSize: getScreenWidth(20),
              fontWeight: FontWeight.w600),
        ),
        backgroundColor: primaryDarkColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: whitecolor,
            size: getScreenWidth(24),
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getScreenWidth(20),
              ),
              child: BlocConsumer<AddNoteCubit, AddNoteState>(
                  listener: (context, state) {
                if (state is AddNoteSuccess) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, homePage, (route) => false);
                }
                if (state is AddNoteError) {
                  showToaster(context, state.msg, redcolor);
                }
              }, builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      spaceHeight(10),
                      Center(
                        child: Text(
                          Services.dateformatter(),
                          textScaleFactor: 1.0,
                          style: textstyle.copyWith(
                              color: blackcolor,
                              fontSize: getScreenWidth(14),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      spaceHeight(30),
                      Text(
                        "Title",
                        style: textstyle.copyWith(
                            fontSize: getScreenWidth(18),
                            fontWeight: FontWeight.w500,
                            color: blackcolor),
                      ),
                      spaceHeight(7),
                      TextFormInput(
                        filledColor: false,
                        hintText: "Title",
                        autofocus: true,
                        counterText: "",
                        minLines: 2,
                        validator: (val) =>
                            (val!.isEmpty ? 'Title is required ' : null),
                        onChanged: (e) {
                          setState(() {
                            note = e;
                          });
                        },
                      ),
                      spaceHeight(20),
                      Text(
                        "Description",
                        style: textstyle.copyWith(
                            fontSize: getScreenWidth(18),
                            fontWeight: FontWeight.w500,
                            color: blackcolor),
                      ),
                      spaceHeight(7),
                      TextFormInput(
                        filledColor: false,
                        hintText: "Description",
                        counterText: "",
                        maxLines: 20,
                        validator: (val) =>
                            (val!.isEmpty ? 'Description is required ' : null),
                        onChanged: (e) {
                          description = e;
                        },
                      ),
                      spaceHeight(30),
                      state is AddNoteLoading
                          ? spiner()
                          : DefaultButton(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<AddNoteCubit>(context)
                                      .createNote(Note(
                                          title: note,
                                          description: description,
                                          date: Services.dateformatter()));
                                }
                              },
                              text: "Create",
                              color: primaryDarkColor,
                              textcolor: whitecolor,
                              width: SizeConfig.screenWidth,
                            ),
                      spaceHeight(20),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
