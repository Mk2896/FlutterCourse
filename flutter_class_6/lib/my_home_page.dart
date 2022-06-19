import 'package:flutter/material.dart';
import 'package:flutter_class_6/screen1.dart';
import 'package:flutter_class_6/screen2.dart';
import 'package:flutter_class_6/screen3.dart';
import 'package:flutter_class_6/screen4.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onTapEvent(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> screens = const [Screen1(), Screen2(), Screen3(), Screen4()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Class 6',
          style: TextStyle(),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Text("Header")),
            InkWell(
              child: Ink(
                color: Colors.yellow,
                width: double.infinity,
                height: 300,
              ),
              onTap: () => print("Test"),
            ),
            GestureDetector(
              child: Container(
                color: Colors.blue,
                width: double.infinity,
                height: 200,
              ),
              onHorizontalDragEnd: (_) => print(_),
            )
          ],
        ),
      ),
      // body: DefaultTabController(
      //   length: 2,
      //   child: Column(
      //     children: const [
      //       TabBar(
      //         tabs: [
      //           Text(
      //             "First Tab",
      //             style: TextStyle(color: Colors.black),
      //           ),
      //           Text(
      //             "Second Tab",
      //             style: TextStyle(color: Colors.black),
      //           ),
      //         ],
      //       ),
      //       Expanded(
      //         child: TabBarView(
      //           children: [
      //             Center(
      //               child: Text("First Tab View"),
      //             ),
      //             Center(
      //               child: Text("Second Tab View"),
      //             )
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      body: screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: "First",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken),
            label: "Second",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.headphones),
            label: "Third",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            label: "Fourth",
          ),
        ],
        backgroundColor: Colors.amber,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onTapEvent,
      ),
    );
  }
}
