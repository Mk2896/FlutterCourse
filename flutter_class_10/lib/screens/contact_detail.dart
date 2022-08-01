import 'package:flutter/material.dart';
import 'package:flutter_class_10/controllers/my_home_screen_controller.dart';
import 'package:flutter_class_10/models/user_model.dart';
import 'package:flutter_class_10/widgets/field.dart';

class ContactDetail extends StatelessWidget {
  const ContactDetail({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Card"),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              fieldDart(context, "Name", user.name!),
              fieldDart(context, "Username", user.username!),
              fieldDart(context, "Email", user.email!),
              fieldDart(context, "Phone", user.phone!),
              fieldDart(context, "Website", user.website!),
              fieldDart(context, "Address",
                  "${user.address!.suite} ${user.address!.street}, ${user.address!.city} - ${user.address!.zipcode}"),
              fieldDart(context, "Company", user.company!.name!),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Location:",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: InkWell(
                        onTap: () => mylaunchUrl(
                          user.address!.geo!.lat!,
                          user.address!.geo!.lng!,
                        ),
                        child: const Text(
                          "View On Map",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
