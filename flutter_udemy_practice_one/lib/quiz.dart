import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final Map<String, dynamic> question;
  final Function answerSelectHandler;
  final VoidCallback nextSelectHandler;
  final VoidCallback prevSelectHandler;

  Quiz(
      {Key? key,
      required this.question,
      required this.answerSelectHandler,
      required this.nextSelectHandler,
      required this.prevSelectHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Question(
          questionText: question['questionText'],
        ),
        ...(question['answers'] as List<Map<String, dynamic>>).map((answer) {
          return Answer(
            answerSelectHandler: () => answerSelectHandler(answer['score']),
            answerText: answer['text'],
          );
        }),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton.extended(
                onPressed: prevSelectHandler,
                heroTag: 'PreviousBtn',
                label: Row(
                  children: [
                    Icon(Icons.navigate_before),
                    Text("Prev"),
                  ],
                ),
              ),
              FloatingActionButton.extended(
                onPressed: nextSelectHandler,
                heroTag: 'NextBtn',
                label: Row(
                  children: [
                    Text("Next"),
                    Icon(Icons.navigate_next),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
