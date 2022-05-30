import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {this.buttoncolor,
      this.textcolor,
      this.height,
      this.width,
      this.text,
      required this.onTap,
      this.hasborder,
      this.borderRadius,
      Key? key})
      : super(key: key);

  final Color? buttoncolor;
  final Color? textcolor;
  final double? height;
  final double? width;
  final String? text;
  final void Function() onTap;
  final bool? hasborder;
  final double? borderRadius;
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
            color: buttoncolor ?? Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(borderRadius ?? 10)),
        child: Text(
          text ?? '',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textcolor ?? Colors.white),
        ),
      ),
    );
  }
}
