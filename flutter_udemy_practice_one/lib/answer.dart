import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback answerSelectHandler;
  final String answerText;

  Answer(
      {Key? key, required this.answerSelectHandler, required this.answerText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text(answerText),
        onPressed: answerSelectHandler,
        color: Colors.blue,
        textColor: Colors.white,
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
    );
  }
}
