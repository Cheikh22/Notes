// ignore_for_file: file_names
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter/material.dart';
import 'package:notes/presentations/constants/constants.dart';
import 'package:notes/presentations/constants/size_config.dart';

ToastFuture showToaster(BuildContext context, String? msg, Color? color) {
  return showToast(
    msg ?? '',
    textPadding: EdgeInsets.symmetric(
      horizontal: getScreenWidth(10),
      vertical: getScreenHeight(5),
    ),
    context: context,
    position: StyledToastPosition.top,
    textStyle: textstyle.copyWith(
        fontSize: getScreenWidth(16),
        color: whitecolor,
        fontWeight: FontWeight.w500),
    backgroundColor: color ?? Colors.red,
    animation: StyledToastAnimation.slideFromRight,
    alignment: Alignment.center,
    reverseAnimation: StyledToastAnimation.slideFromRight,
    duration: const Duration(seconds: 7),
    animDuration: const Duration(milliseconds: 350),
    fullWidth: false,
    isHideKeyboard: false,
  );
}
