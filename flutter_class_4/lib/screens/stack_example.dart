import 'package:flutter/material.dart';

class MyStack extends StatelessWidget {
  const MyStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Stack(
              alignment: Alignment.center,
              children: const [
                Icon(
                  Icons.notifications,
                  size: 35,
                ),
                Positioned(
                    right: 0,
                    top: 12,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 10,
                      child: Text(
                        "3",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
