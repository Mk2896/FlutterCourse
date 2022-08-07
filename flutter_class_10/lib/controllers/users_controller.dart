import 'dart:convert';
import 'dart:developer';

import 'package:flutter_class_10/env.dart';
import 'package:flutter_class_10/models/user_model.dart';
import 'package:http/http.dart' as http;

Future<List<UserModel>> getUsers() async {
  String endPoint = "users";
  Uri url = Uri.parse("$baseUrl/$endPoint");

  var response = await http.get(url);
  var jsonData = jsonDecode(response.body);

  if (jsonData['success']) {
    List<UserModel> users = [];

    for (var item in jsonData['data']) {
      UserModel user = UserModel.fromJson(item);

      users.add(user);
    }

    return users;
  } else {
    throw ("Something Went Wrong");
  }
}

Future<UserModel> getUser(String id) async {
  String endPoint = "users/$id";
  Uri url = Uri.parse("$baseUrl/$endPoint");

  var response = await http.get(url);
  var jsonData = jsonDecode(response.body);

  UserModel user = UserModel.fromJson(jsonData);
  return user;
}

Future<Map> storeUser(UserModel user) async {
  String endPoint = "users";
  Uri url = Uri.parse("$baseUrl/$endPoint");
  Map<String, String> header = {
    "Content-type": "application/json",
    "Accept": "application/json"
  };
  var response =
      await http.post(url, headers: header, body: jsonEncode(user.toJson()));
  var jsonData = jsonDecode(response.body);

  return jsonData;
}

Future<Map> updateUser(UserModel user) async {
  String endPoint = "users/${user.id.toString()}";
  Uri url = Uri.parse("$baseUrl/$endPoint");
  Map<String, String> header = {
    "Content-type": "application/json",
    "Accept": "application/json"
  };
  var response =
      await http.put(url, headers: header, body: jsonEncode(user.toJson()));
  var jsonData = jsonDecode(response.body);

  return jsonData;
}

Future<Map> deleteUser(int id) async {
  String endPoint = "users/$id";
  Uri url = Uri.parse("$baseUrl/$endPoint");

  var response = await http.delete(url);
  var jsonData = jsonDecode(response.body);

  return jsonData;
}
