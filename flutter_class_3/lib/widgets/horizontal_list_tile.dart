import 'package:flutter/material.dart';

Widget horizontalListTiles(
    {required String title, required BuildContext context}) {
  return Container(
    margin: EdgeInsets.only(right: 5),
    color: Colors.red,
    width: MediaQuery.of(context).size.width * 0.5,
    child: Center(
        child: Text(
      title,
      style: TextStyle(fontSize: 25),
    )),
  );
}
