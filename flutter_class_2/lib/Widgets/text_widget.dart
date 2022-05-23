import 'package:flutter/material.dart';

textWidget({required String text, double fontSize = 20}) {
  // fontSize ??= 15;
  return Text(
    text,
    style: TextStyle(
      color: Colors.black,
      fontSize: fontSize,
    ),
  );
}
