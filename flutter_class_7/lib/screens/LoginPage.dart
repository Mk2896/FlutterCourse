import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_class_7/screens/SignUpPage.dart';
import 'package:flutter_class_7/widgets/snackbar.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signIn(context) async {
    try {
      var userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
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
        title: const Text("Login Page"),
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
            onPressed: () => _signIn(context),
            child: const Text("Login"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpPage()),
              );
            },
            child: const Text("Go To Sign Up"),
          ),
        ],
      ),
    );
  }
}
