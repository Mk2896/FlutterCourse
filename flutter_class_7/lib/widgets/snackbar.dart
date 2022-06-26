import 'package:flutter/material.dart';

void showInSnackBar(String? value, BuildContext context) {
  // ignore: deprecated_member_use
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(value!),
    backgroundColor: Colors.red,
  ));
}
