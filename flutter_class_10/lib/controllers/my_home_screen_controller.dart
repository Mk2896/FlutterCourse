import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_class_10/controllers/users_controller.dart';
import 'package:flutter_class_10/models/user_model.dart';
import 'package:flutter_class_10/widgets/loading.dart';
import 'package:flutter_class_10/widgets/snackbar.dart';
import 'package:flutter_class_10/widgets/user_form.dart';
import 'package:loader_overlay/loader_overlay.dart';

Future<void> deleteUserMethod(
  int id,
  BuildContext context,
  void Function() method,
) async {
  !context.loaderOverlay.visible
      ? context.loaderOverlay
          .show(widget: const Loading(loadingText: "Deleting User.."))
      : null;
  Map response = await deleteUser(id);
  context.loaderOverlay.visible ? context.loaderOverlay.hide() : null;
  Color color = response['success'] ? Colors.green : Colors.red;
  String message = response['success'] ? response['message'] : response['error'];
  method();
  snackBar(message, color, context);
}

void editUserMethod(
    UserModel user, BuildContext context, void Function() updateMethod) {
  showModalBottomSheet(
    context: context,
    builder: (context) => UserForm(
      user: user,
      updateMethod: updateMethod,
      edit: true,
    ),
    isScrollControlled: true,
    constraints: BoxConstraints.tight(Size(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height * 0.8,
    )),
  );
}

void createUserMethod(BuildContext context, void Function() updateMethod) {
  showModalBottomSheet(
    context: context,
    builder: (context) => UserForm(
      updateMethod: updateMethod,
    ),
    isScrollControlled: true,
    constraints: BoxConstraints.tight(Size(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height * 0.8,
    )),
  );
}

Future<void> storeUserMethod(
  UserModel user,
  BuildContext context,
  void Function() method,
) async {
  !context.loaderOverlay.visible
      ? context.loaderOverlay
          .show(widget: const Loading(loadingText: "Creating User.."))
      : null;
  Map response = await storeUser(user);
  context.loaderOverlay.hide();

  Navigator.of(context).pop();
  Color color = response['success'] ? Colors.green : Colors.red;
  String message =
      response['success'] ? response['data'] : response['error'].toString();
  method();
  snackBar(message, color, context);
}

Future<void> updateUserMethod(
  UserModel user,
  BuildContext context,
  void Function() method,
) async {
  !context.loaderOverlay.visible
      ? context.loaderOverlay
          .show(widget: const Loading(loadingText: "Updating User.."))
      : null;

  Map response = await updateUser(user);
  context.loaderOverlay.visible ? context.loaderOverlay.hide() : null;

  Navigator.of(context).pop();
  Color color = response['success'] ? Colors.green : Colors.red;
  String message = response['success'] ? response['message'] : response['error'];
  method();
  snackBar(message, color, context);
}
