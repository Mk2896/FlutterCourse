import 'package:flutter/material.dart';

Widget listTiles({
  required String title,
  required String trailing,
  required String subtitle,
  required String imageText,
}) {
  return Container(
    margin: EdgeInsets.only(bottom: 5),
    child: ListTile(
      tileColor: Colors.green,
      contentPadding: const EdgeInsets.all(10),
      leading: CircleAvatar(
        backgroundColor: Colors.red,
        child: Text(
          imageText,
          style: TextStyle(color: Colors.white),
        ),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(trailing),
        const Icon(Icons.notification_add),
      ]),
    ),
  );
}
