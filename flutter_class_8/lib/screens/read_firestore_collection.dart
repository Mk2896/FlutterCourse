import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_class_8/screens/read_firestore_document.dart';
import 'package:flutter_class_8/widgets/global/snackbar.dart';

class ReadFirestoreCollection extends StatefulWidget {
  const ReadFirestoreCollection({Key? key}) : super(key: key);

  @override
  State<ReadFirestoreCollection> createState() =>
      _ReadFirestoreCollectionState();
}

class _ReadFirestoreCollectionState extends State<ReadFirestoreCollection> {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future<void> deleteUser(documentID, BuildContext context) {
    return users
        .doc(documentID)
        .delete()
        .then((value) => snackBar("User Deleted", Colors.green, context))
        .catchError((error) =>
            snackBar("Failed to delete user: $error", Colors.red, context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Read Firestore Collection"),
      ),
      body: Center(
        child: FutureBuilder<QuerySnapshot>(
          future: users.get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }

            if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
              return const Text("No Data Found");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return ListTile(
                    title: Text(data['name']),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['phone']),
                        Text(data['email']),
                      ],
                    ),
                    trailing: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ReadFirestoreDocument(
                                              documentId: document.id),
                                    ),
                                  ),
                              icon: const Icon(Icons.remove_red_eye)),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  deleteUser(document.id, context);
                                });
                              },
                              icon: const Icon(Icons.delete)),
                        ],
                      ),
                    ),
                    isThreeLine: true,
                  );
                }).toList(),
              );
            }

            return const Text("loading");
          },
        ),
      ),
    );
  }
}
