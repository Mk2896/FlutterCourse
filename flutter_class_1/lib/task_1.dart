import 'package:flutter/material.dart';

class Task1 extends StatelessWidget {
  const Task1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.blue,
          height: 150,
          width: 200,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    color: Colors.red,
                    width: 50,
                    height: 50,
                  ),
                  Container(
                    color: Colors.green,
                    width: 50,
                    height: 50,
                  ),
                  Container(
                    color: Colors.yellow,
                    width: 50,
                    height: 50,
                  ),
                  Container(
                    color: Colors.indigo,
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    color: Colors.grey,
                    width: 50,
                    height: 50,
                  ),
                  Container(
                    color: Colors.pink,
                    width: 50,
                    height: 50,
                  ),
                  Container(
                    color: Colors.orange,
                    width: 50,
                    height: 50,
                  ),
                  Container(
                    color: Colors.limeAccent,
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    color: Colors.purple,
                    width: 50,
                    height: 50,
                  ),
                  Container(
                    color: Colors.brown,
                    width: 50,
                    height: 50,
                  ),
                  Container(
                    color: Colors.lightBlue,
                    width: 50,
                    height: 50,
                  ),
                  Container(
                    color: Colors.tealAccent,
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
