import 'package:flutter/material.dart';
import 'package:flutter_class_10/controllers/users_controller.dart';
import 'package:flutter_class_10/models/user_model.dart';
import 'package:flutter_class_10/screens/contact_detail.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<UserModel>> users = getUsers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Contact List"),
        ),
        body: FutureBuilder(
          future: users,
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
                      title: Text(userData[index].name!),
                      subtitle: Text(userData[index].email!),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
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
        ));
  }
}
