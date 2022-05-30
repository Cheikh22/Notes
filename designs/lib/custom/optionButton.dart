import 'package:design/utils/constants.dart';
import 'package:design/utils/widgets_fuctions.dart';
import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final double? width;

  const OptionButton(
      {Key? key, required this.text, required this.icon, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: FlatButton(
        color: COLOR_DARK_BLUE,
        splashColor: COLOR_WHITE.withAlpha(50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        onPressed: () {},
        child: Row(
          children: [
            Icon(icon, color: COLOR_WHITE),
            addHorizontalSpace(10),
            Text(text, style: TextStyle(color: COLOR_WHITE))
          ],
        ),
      ),
    );
  }
}
