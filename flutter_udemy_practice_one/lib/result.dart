import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetSubmitHandler;
  Result({Key? key, required this.totalScore, required this.resetSubmitHandler})
      : super(key: key);

  String get resultPhrase {
    if (totalScore <= 35) {
      return "You are Boring!";
    } else if (totalScore <= 70) {
      return "You need to work on yourself loser!";
    } else if (totalScore <= 120) {
      return "Keep it up you can be cool!";
    } else {
      return "You are cool bro..";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              resultPhrase,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          FloatingActionButton(
            onPressed: resetSubmitHandler,
            heroTag: 'ResetBtn',
            child: Icon(Icons.restart_alt_rounded),
          ),
        ],
      ),
    );
  }
}
