import 'dart:convert';

import 'package:flutter_class_10/env.dart';
import 'package:flutter_class_10/models/user_model.dart';
import 'package:http/http.dart' as http;

Future<List<UserModel>> getUsers() async {
  String endPoint = "users";
  Uri url = Uri.parse("$baseUrl/$endPoint");

  var response = await http.get(url);
  var jsonData = jsonDecode(response.body);

  List<UserModel> users = [];

  for (var item in jsonData) {
    UserModel user = UserModel.fromJson(item);

    users.add(user);
  }

  return users;
}
