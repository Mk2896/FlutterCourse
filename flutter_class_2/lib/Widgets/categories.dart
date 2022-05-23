import 'package:flutter/material.dart';
import 'package:flutter_class_2/Widgets/container_widget.dart';
import 'package:flutter_class_2/Widgets/text_widget.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return containerWidget(
      bgColor: Colors.yellow,
      height: 150,
      width: 250,
      child: textWidget(text: "Categories"),
    );
  }
}
