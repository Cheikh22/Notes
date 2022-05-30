import 'dart:ui';
import 'package:design/screens/LandingPage.dart';
import 'package:design/screens/Login_page.dart';
import 'package:design/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'design',
      theme: ThemeData(
          primaryColor: COLOR_WHITE,
          textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
          fontFamily: "Montserrat", colorScheme: ColorScheme.fromSwatch().copyWith(secondary: COLOR_DARK_BLUE)),
      home: LoginPage(),
    );
  }
}
