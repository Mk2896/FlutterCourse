import 'package:flutter/material.dart';

containerWidget({
  required Color bgColor,
  required double height,
  double width = 300,
  Widget? child,
}) {
  return Container(
    color: bgColor,
    width: width,
    height: height,
    child: child,
  );
}
