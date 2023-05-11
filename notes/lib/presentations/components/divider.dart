import 'package:flutter/material.dart';
import 'package:notes/presentations/constants/size_config.dart';

Widget defaultdivider({double? height, Color? color, double? width, double? thickness}) {
  return SizedBox(
    width: width ?? 40,
    child: Divider(
      height: height ?? getScreenHeight(6),
      thickness: thickness ?? getScreenWidth(1),
      color: color ??const Color.fromARGB(58, 111, 109, 109),
    ),
  );
}
