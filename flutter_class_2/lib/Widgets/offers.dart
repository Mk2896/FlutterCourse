import 'package:flutter/material.dart';
import 'package:flutter_class_2/Widgets/container_widget.dart';

class Offers extends StatelessWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return containerWidget(
      bgColor: Colors.orange,
      height: 250,
      width: 350,
    );
  }
}
