import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notes/presentations/constants/constants.dart';
import 'package:notes/presentations/constants/size_config.dart';
import 'package:notes/presentations/constants/string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 3600), () {
      Navigator.pushNamedAndRemoveUntil(context, homePage, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              primaryDarkColor,
              primaryColor.withOpacity(0.8),
              primaryDarkColor
            ],
            stops: const [0, 0.5, 1],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Notes",
                style: textstyle.copyWith(
                    fontSize: getScreenWidth(45),
                    fontWeight: FontWeight.w900,
                    color: whitecolor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
