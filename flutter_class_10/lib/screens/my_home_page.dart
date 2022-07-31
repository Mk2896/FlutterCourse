import 'package:flutter/material.dart';
import 'package:flutter_class_10/controllers/users_controller.dart';
import 'package:flutter_class_10/models/user_model.dart';
import 'package:flutter_class_10/widgets/field.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<UserModel>> users = getUsers();

  Future<void> _launchUrl(String lat, String lng) async {
    Uri url =
        Uri.parse('https://www.google.com/maps/place/$lat,$lng/@$lat,$lng,14z');
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Contact Cards"),
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
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                        bottom: 20,
                        left: 4,
                        right: 4,
                      ),
                      decoration: BoxDecoration(border: Border.all(width: 2)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 7),
                      child: Column(
                        children: [
                          fieldDart(context, "Name", userData[index].name!),
                          fieldDart(
                              context, "Username", userData[index].username!),
                          fieldDart(context, "Email", userData[index].email!),
                          fieldDart(context, "Phone", userData[index].phone!),
                          fieldDart(
                              context, "Website", userData[index].website!),
                          fieldDart(context, "Address",
                              "${userData[index].address!.suite} ${userData[index].address!.street}, ${userData[index].address!.city} - ${userData[index].address!.zipcode}"),
                          fieldDart(context, "Company",
                              userData[index].company!.name!),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Location:",
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: InkWell(
                                  onTap: () => _launchUrl(
                                      userData[index].address!.geo!.lat!,
                                      userData[index].address!.geo!.lng!),
                                  child: Text(
                                    "${userData[index].address!.geo!.lat}, ${userData[index].address!.geo!.lng}",
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
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
