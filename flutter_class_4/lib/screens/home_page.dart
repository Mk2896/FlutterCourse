import 'package:flutter/material.dart';
import 'package:flutter_class_4/constants/color_constants.dart';
import 'package:flutter_class_4/constants/text_constants.dart';
import 'package:flutter_class_4/screens/login.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(ColorConstant.primaryColor),
          title: const Text(TextConstants.appBarText),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
            ),
          ],
        ),
        body: Column(
          children: const [
            ListTile(
              minVerticalPadding: 40,
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg"),
              ),
              tileColor: Colors.yellow,
            ),
            ListTile(
              minVerticalPadding: 40,
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/image.webp"),
              ),
              tileColor: Colors.blue,
            ),
          ],
        ));
  }
}
