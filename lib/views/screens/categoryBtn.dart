// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:walkmate/views/shared/style.dart';

class CategoryBtn extends StatelessWidget {
  const CategoryBtn(
      {super.key, required this.buttonClr, required this.label, this.onPress});
  final Color buttonClr;
  final String label;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.255,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: buttonClr,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(9)),
        ),
        child: Text(
          label,
          style: textStyle(20, buttonClr, FontWeight.w600),
        ),
      ),
    );
  }
}
