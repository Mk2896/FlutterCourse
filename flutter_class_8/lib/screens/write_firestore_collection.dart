import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_class_8/widgets/global/custom_text_field.dart';
import 'package:flutter_class_8/widgets/global/extension.dart';
import 'package:flutter_class_8/widgets/global/snackbar.dart';

class WriteFirestoreCollection extends StatelessWidget {
  WriteFirestoreCollection({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> addUser(context) async {
    if (_formKey.currentState!.validate()) {
      Map<String, String> data = {
        "name": _nameController.text,
        "phone": _phoneController.text,
        "email": _emailController.text,
      };
      FirebaseFirestore.instance
          .collection("users")
          .add(data)
          .then((value) => snackBar("User Added", Colors.green, context))
          .catchError((error) =>
              snackBar("Failed to Add data: $error", Colors.red, context));

      _emailController.text = "";
      _phoneController.text = "";
      _nameController.text = "";
    }
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Email Address is required";
    } else if (!value.isValidEmail()) {
      return "Invalid Email Address";
    }
    return null;
  }

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    }
    return null;
  }

  String? _phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone Number is required";
    } else if (value.length != 11) {
      return "Invalid Phone Number";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Cloud Firestore'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(
                textController: _nameController,
                hintText: "Enter Name",
                validationMethod: _nameValidator,
              ),
              CustomTextField(
                textController: _phoneController,
                hintText: "Enter Phone Number",
                keyboardType: TextInputType.phone,
                validationMethod: _phoneValidator,
              ),
              CustomTextField(
                textController: _emailController,
                hintText: "Enter Email",
                keyboardType: TextInputType.emailAddress,
                validationMethod: _emailValidator,
              ),
              ElevatedButton(
                  onPressed: () => addUser(context),
                  child: const Text('Add User')),
            ],
          ),
        ),
      ),
    );
  }
}
