import 'package:flutter/material.dart';

class Task3 extends StatelessWidget {
  const Task3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
        actions: const [Icon(Icons.logout)],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Container(
            width: 400,
            height: 200,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                  ),
                  Container(
                    width: 150,
                    height: double.infinity,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                  ),
                  Container(
                    width: 150,
                    height: double.infinity,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                  ),
                  Container(
                    width: 150,
                    height: double.infinity,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                  ),
                  Container(
                    width: 150,
                    height: double.infinity,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                  ),
                  Container(
                    width: 150,
                    height: double.infinity,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(100),
          ),
          Container(
            width: double.infinity,
            height: 200,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        color: Colors.black,
                      ),
                      Container(
                        width: 150,
                        height: 100,
                        color: Colors.black,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        color: Colors.black,
                      ),
                      Container(
                        width: 150,
                        height: 100,
                        color: Colors.black,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        color: Colors.black,
                      ),
                      Container(
                        width: 150,
                        height: 100,
                        color: Colors.black,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        color: Colors.black,
                      ),
                      Container(
                        width: 150,
                        height: 100,
                        color: Colors.black,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        color: Colors.black,
                      ),
                      Container(
                        width: 150,
                        height: 100,
                        color: Colors.black,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        color: Colors.black,
                      ),
                      Container(
                        width: 150,
                        height: 100,
                        color: Colors.black,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
