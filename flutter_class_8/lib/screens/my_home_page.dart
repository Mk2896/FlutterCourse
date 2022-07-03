import 'package:flutter/material.dart';
import 'package:flutter_class_8/screens/read_firestore_collection.dart';
import 'package:flutter_class_8/screens/write_firestore_collection.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cloud Firestore Example"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => WriteFirestoreCollection(),
              )),
              child: const Text("Write Data To FireStore"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ReadFirestoreCollection(),
              )),
              child: const Text("Read Data From FireStore"),
            ),
          ],
        ),
      ),
    );
  }
}
