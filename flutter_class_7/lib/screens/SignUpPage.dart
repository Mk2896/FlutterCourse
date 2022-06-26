import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_class_7/widgets/snackbar.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signUp(context) async {
    try {
      var userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      inspect(userCredential);
      showInSnackBar("Sign Up Successfully", context);
    } on FirebaseAuthException catch (e) {
      showInSnackBar(e.message, context);
    } catch (e) {
      showInSnackBar(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TextField(
              controller: _emailController,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TextField(
              controller: _passwordController,
              obscureText: true,
            ),
          ),
          ElevatedButton(
            onPressed: () => _signUp(context),
            child: const Text("Sign Up"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Go To Login"),
          ),
        ],
      ),
    );
  }
}
