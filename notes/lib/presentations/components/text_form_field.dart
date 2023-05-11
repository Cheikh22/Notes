import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:notes/presentations/constants/constants.dart';
import 'package:notes/presentations/constants/size_config.dart';

class TextFormInput extends StatelessWidget {
  const TextFormInput(
      {this.controller,
      this.hintText,
      this.suffixIcon,
      this.filledColor = false,
      this.validator,
      this.obsecure = false,
      this.filled = true,
      this.onChanged,
      this.maxLength,
      this.inputFormatters,
      this.keyboardType,
      this.onTap,
      Key? key})
      : super(key: key);

  final FormFieldValidator<String>? validator;
  final bool obsecure;
  final TextEditingController? controller;
  final String? hintText;
  final bool filledColor;
  final Widget? suffixIcon;
  final bool filled;
  final void Function(String)? onChanged;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      controller: controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
              left: getScreenWidth(15),
              right: getScreenWidth(15)),
          errorMaxLines: 4,
          errorStyle: textstyle.copyWith(
              color: redcolor, fontSize: getScreenWidth(12)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade600),
            borderRadius: BorderRadius.all(
                Radius.circular(getScreenWidth(7))),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.all(
                Radius.circular(getScreenWidth(7))),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade600),
            borderRadius: BorderRadius.all(
                Radius.circular(getScreenWidth(7))),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.all(
                Radius.circular(getScreenWidth(7))),
          ),
          hintText: hintText,
          fillColor: filled
              ? (filledColor)
                  ? redlightcolor
                  : greylightycolor
              : whitecolor,
          filled: true,
          suffixIcon: suffixIcon),
      validator: validator,
      obscureText: obsecure,
      onChanged: onChanged,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      onTap: onTap,
    );
  }
}
