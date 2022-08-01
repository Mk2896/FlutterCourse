import 'package:flutter/material.dart';

Widget fieldDart(BuildContext context, String fieldName, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$fieldName:",
          style: const TextStyle(fontWeight: FontWeight.w900),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Text(text),
        )
      ],
    ),
  );
}
