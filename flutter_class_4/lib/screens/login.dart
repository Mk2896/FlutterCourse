import 'package:flutter/material.dart';
import 'package:flutter_class_4/constants/color_constants.dart';
import 'package:flutter_class_4/constants/text_constants.dart';
import 'package:flutter_class_4/screens/home_page.dart';
import 'package:flutter_class_4/screens/set_state_example.dart';
import 'package:flutter_class_4/screens/stack_example.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.pushAndRemoveUntil(
                // Navigator.replace(
                // Navigator.pop(
                // Navigator.pushReplacement(context,
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const Text(TextConstants.loginBtnText),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SetStateExample()));
              },
              child: const Text(TextConstants.stateBtnText),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyStack()));
              },
              child: const Text("Stack Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
