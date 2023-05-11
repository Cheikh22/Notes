import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:notes/presentations/constants/constants.dart';

import '../constants/size_config.dart';

Widget spiner({double? size}) {
  return SpinKitFadingCircle(
    color: primaryColor,
    size: getScreenWidth(size ?? 30),
  );
}
