import 'package:flutter/material.dart';

const HOME_ROUTE = '/';
const ADD_NOTE_ROUTE ="/add_note";
const EDIT_NOTE_ROUTE = "/edit_note";


const Color primaryDarkColor = Color(0xFF0f330f);
const Color primaryColor = Color(0xFF5C821A);
const Color secondaryColor = Color(0xFFC6D166);
const Color errorcolor = Color(0xFFF0810F);

// const Color maindarkcolor = Color(0xFF011A27);
// const Color maincolor = Color(0xFF302c7d);
// const Color secondaryColor = Color(0xFF39b1c2);
// const Color thirdcolor = Color(0xFFe7097a);

const textstyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white);

    

const textFormDecoration = InputDecoration(
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.all(Radius.circular(15))),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.all(Radius.circular(15))),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.all(Radius.circular(15))),
    disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.all(Radius.circular(15))));

 Widget spaceHeight(double height){
  return SizedBox(height :height);
}

 Widget spaceWidth(double width){
  return SizedBox(width : width);
}

