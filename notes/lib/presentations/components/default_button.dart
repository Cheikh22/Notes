import 'package:notes/presentations/constants/constants.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {this.color,
      this.textcolor,
      this.textsize,
      this.height,
      this.width,
      this.text,
      required this.onTap,
      this.hasborder,
      this.borderRadius,
      this.prefixIcon,
      this.suffixIcon,
      Key? key})
      : super(key: key);

  final Color? color;
  final Color? textcolor;
  final double? textsize;
  final double? height;
  final double? width;
  final String? text;
  final void Function() onTap;
  final bool? hasborder;
  final double? borderRadius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height ?? 45,
        width: width ?? 250,
        decoration: BoxDecoration(
            border: (hasborder ?? false)
                ? Border.all(color: textcolor ?? Colors.black)
                : null,
            color: color ?? primaryColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 10)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          prefixIcon ?? Container(),
          Text(
            text ?? '',
            style: textstyle.copyWith(
                fontSize: textsize ?? 16,
                fontWeight: FontWeight.w600,
                color: textcolor ?? Colors.white),
            textScaleFactor: 1.0,
          ),
          suffixIcon ?? Container()
        ]),
      ),
    );
  }
}
