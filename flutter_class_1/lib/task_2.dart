import 'package:flutter/material.dart';

class Task2 extends StatelessWidget {
  const Task2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
        actions: const [Icon(Icons.logout)],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.black,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 300,
                        color: Colors.orange,
                      ),
                      Container(
                        width: 100,
                        height: 300,
                        color: Colors.pink,
                      ),
                      Container(
                        width: 100,
                        height: 300,
                        color: Colors.yellow,
                      ),
                      Container(
                        width: 100,
                        height: 300,
                        color: Colors.white,
                      ),
                      Container(
                        width: 100,
                        height: 300,
                        color: Colors.pink,
                      ),
                      Container(
                        width: 100,
                        height: 300,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.blue,
              ),
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.yellow,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        fixedColor: Colors.yellow,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.ac_unit,
            ),
            label: "First Item",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.access_alarm,
            ),
            label: "Second Item",
          ),
        ],
      ),
    );
  }
}
