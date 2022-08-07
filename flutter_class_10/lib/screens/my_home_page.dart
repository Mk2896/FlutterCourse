import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_class_10/controllers/my_home_screen_controller.dart';
import 'package:flutter_class_10/controllers/users_controller.dart';
import 'package:flutter_class_10/models/user_model.dart';
import 'package:flutter_class_10/screens/contact_detail.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Contact List"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => createUserMethod(context, updateState),
          child: const Icon(Icons.add),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            updateState();
            return Future.delayed(const Duration(seconds: 1));
          },
          child: FutureBuilder(
            future: getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString(),
                      style: const TextStyle(
                        fontSize: 30,
                      )),
                );
              }

              if (snapshot.hasData) {
                List<UserModel> userData = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    itemCount: userData.length,
                    itemBuilder: (BuildContext context, index) {
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(userData[index].name!),
                                  Text(userData[index].email!),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () => editUserMethod(
                                      userData[index],
                                      context,
                                      updateState,
                                    ),
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () => deleteUserMethod(
                                      userData[index].id!,
                                      context,
                                      updateState,
                                    ),
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ContactDetail(
                            user: userData[index],
                          ),
                        )),
                      );
                    },
                  ),
                );
              }

              return const Center(
                child: Text("No Data Found",
                    style: TextStyle(
                      fontSize: 30,
                    )),
              );
            },
          ),
        ));
  }
}
