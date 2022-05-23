import 'package:flutter/material.dart';
import 'package:flutter_class_2/Widgets/container_widget.dart';
import 'package:flutter_class_2/Widgets/text_widget.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return containerWidget(
      bgColor: Colors.red,
      height: 200,
      child: textWidget(
        text: "Popular Widget",
        fontSize: 35,
      ),
    );
  }
}
