import 'package:flutter/material.dart';
import 'package:flutter_class_3/widgets/horizontal_list_tile.dart';
import 'package:flutter_class_3/widgets/list_tile.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: const Icon(Icons.whatsapp_rounded),
        actions: const [
          Icon(Icons.search),
          Padding(
            padding: EdgeInsets.only(left: 10),
          ),
          Icon(Icons.notification_add),
          Padding(
            padding: EdgeInsets.only(left: 10),
          ),
        ],
      ),
      
      // Basic ListView
      // body: ListView(
      //   children: [
      //     ...listTiles(
      //         title: "Ali",
      //         trailing: "12:00 AM",
      //         subtitle: "Hey",
      //         imageText: "MK"),
      //     ...listTiles(
      //         title: "Ali",
      //         trailing: "12:00 AM",
      //         subtitle: "Hey",
      //         imageText: "MK"),
      //     ...listTiles(
      //         title: "Ali",
      //         trailing: "12:00 AM",
      //         subtitle: "Hey",
      //         imageText: "MK"),
      //     ...listTiles(
      //         title: "Ali",
      //         trailing: "12:00 AM",
      //         subtitle: "Hey",
      //         imageText: "MK"),
      //     ...listTiles(
      //         title: "Ali",
      //         trailing: "12:00 AM",
      //         subtitle: "Hey",
      //         imageText: "MK"),
      //     ...listTiles(
      //         title: "Ali",
      //         trailing: "12:00 AM",
      //         subtitle: "Hey",
      //         imageText: "MK"),
      //     ...listTiles(
      //         title: "Ali",
      //         trailing: "12:00 AM",
      //         subtitle: "Hey",
      //         imageText: "MK"),
      //     ...listTiles(
      //         title: "Ali",
      //         trailing: "12:00 AM",
      //         subtitle: "Hey",
      //         imageText: "MK"),
      //     ...listTiles(
      //         title: "Ali",
      //         trailing: "12:00 AM",
      //         subtitle: "Hey",
      //         imageText: "MK"),
      //     ...listTiles(
      //         title: "Ali",
      //         trailing: "12:00 AM",
      //         subtitle: "Hey",
      //         imageText: "MK"),
      //     ...listTiles(
      //         title: "Ali",
      //         trailing: "12:00 AM",
      //         subtitle: "Hey",
      //         imageText: "MK"),
      //     ...listTiles(
      //         title: "Ali",
      //         trailing: "12:00 AM",
      //         subtitle: "Hey",
      //         imageText: "MK"),
      //   ],
      // ),

      // If you want all the screen to scroll
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Container(
      //         color: Colors.yellow,
      //         width: 200,
      //         height: 200,
      //       ),
      //       ListView.builder(
      //           physics: const NeverScrollableScrollPhysics(),
      //           shrinkWrap: true,
      //           itemCount: 15,
      //           itemBuilder: (context, index) {
      //             return listTiles(
      //                 title: "Ali",
      //                 trailing: "12:00 AM",
      //                 subtitle: "Hey",
      //                 imageText: "MK");
      //           }),
      //     ],
      //   ),
      // ),

      // If you want only listview to scroll and top part of the screen to stay
      // body: Column(
      //   children: [
      //     Container(
      //       color: Colors.yellow,
      //       width: double.infinity,
      //       height: 200,
      //     ),
      //     Expanded(
      //       child: ListView.builder(
      //           padding: EdgeInsets.zero,
      //           itemCount: 15,
      //           itemBuilder: (context, index) {
      //             return listTiles(
      //                 title: "Ali",
      //                 trailing: "12:00 AM",
      //                 subtitle: "Hey",
      //                 imageText: "MK");
      //           }),
      //     ),
      //   ],
      // ),

      // Making Top Part Also Scroll
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.yellow,
              width: double.infinity,
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return horizontalListTiles(
                      title: "Ali",
                      context: context,
                    );
                  }),
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return listTiles(
                        title: "Ali",
                        trailing: "12:00 AM",
                        subtitle: "Hey",
                        imageText: "MK");
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
