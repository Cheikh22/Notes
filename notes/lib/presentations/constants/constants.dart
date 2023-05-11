import 'package:flutter/material.dart';
import 'package:notes/presentations/constants/size_config.dart';

const Color primaryDarkColor = Color(0xFF0f330f);
const Color primaryColor = Color.fromARGB(255, 77, 116, 10);
const Color secondaryColor = Color(0xFFC6D166);
const Color backgroundcolor = Color.fromARGB(255, 228, 228, 191);
const Color errorcolor = Color(0xFFF0810F);

// const primarycolor = Color(0xFF2359AF);
// const plightcolor = Color.fromARGB(39, 35, 89, 175);
// const secondaryColor = Color(0xFF2359AF);
const warningcolor = Color(0xFFF0810F);
const blackcolor = Color(0xFF000000);
const whitecolor = Color(0xFFFFFFFF);
const redcolor = Color(0xFFDC2626);
const darkredcolor = Color(0xFF7F1D1D);
const redlightcolor = Color(0xFFFEF2F2);
const greylightycolor = Color(0xFFF4F4F5);
final kgrey100 = Colors.grey.shade100;
final kgrey200 = Colors.grey.shade200;
final kgrey300 = Colors.grey.shade300;
final kgrey400 = Colors.grey.shade400;
const kgrey500 = Color(0xFF737373);
const kgrey900 = Color(0xFF171717);
const greencolor = Color(0xFF14532D);
final green100 = Colors.green.shade100;
final red100 = Colors.red.shade100;
final blue100 = Colors.blue.shade100;
final blue50 = Colors.blue.shade50;

TextStyle textstyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: getScreenWidth(14),
    fontWeight: FontWeight.w400,
    color: Colors.black);

final textformdecoration = InputDecoration(
  contentPadding:
      EdgeInsets.only(left: getScreenWidth(15), right: getScreenWidth(15)),
  errorMaxLines: 4,
  errorStyle: textstyle.copyWith(color: redcolor, fontSize: getScreenWidth(12)),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade600),
    borderRadius: BorderRadius.all(Radius.circular(getScreenWidth(7))),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade300),
    borderRadius: BorderRadius.all(Radius.circular(getScreenWidth(7))),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade600),
    borderRadius: BorderRadius.all(Radius.circular(getScreenWidth(7))),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade300),
    borderRadius: BorderRadius.all(Radius.circular(getScreenWidth(7))),
  ),
  fillColor: kgrey100,
  filled: true,
);

Widget spaceHeight(double height) {
  return SizedBox(height: getScreenHeight(height));
}

Widget spaceWidth(double width) {
  return SizedBox(width: getScreenWidth(width));
}

void getTo(BuildContext context, String route) {
  Navigator.pushNamed(context, route);
}

void getOffTo(BuildContext context, String route) {
  Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
}

void getPop(BuildContext context) {
  Navigator.pop(context);
}
