import 'package:flutter/material.dart';
import 'package:flutter_class_2/Widgets/categories.dart';
import 'package:flutter_class_2/Widgets/offers.dart';
import 'package:flutter_class_2/Widgets/popular_products.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Class 2"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          PopularProducts(),
          Categories(),
          Offers(),
        ],
      ),
    );
  }
}
