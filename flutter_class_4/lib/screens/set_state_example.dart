import 'package:flutter/material.dart';

class SetStateExample extends StatefulWidget {
  const SetStateExample({Key? key}) : super(key: key);

  @override
  State<SetStateExample> createState() => _SetStateExampleState();
}

class _SetStateExampleState extends State<SetStateExample> {
  int number = 0;
  subtractNumber() {
    number--;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$number"),
            ElevatedButton(
              onPressed: () => subtractNumber(),
              child: const Text('Subtract'),
            )
          ],
        ),
      ),
    );
  }
}
