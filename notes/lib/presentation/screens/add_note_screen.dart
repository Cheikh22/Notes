import 'package:flutter/material.dart';
import 'package:notes/constants/string.dart';

class AddNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add note"),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: TextField(
          keyboardType: TextInputType.multiline,
          minLines: 30,
          maxLines: null,
        ),
      ),
    );
  }
}
