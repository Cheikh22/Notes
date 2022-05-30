import 'package:flutter/material.dart';

const textstyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.black);

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
