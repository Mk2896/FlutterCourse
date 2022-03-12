import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function answerQuestionSubmitHandler;

  NewTransaction({Key? key, required this.answerQuestionSubmitHandler})
      : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // String? titleInput;
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final entereredTitle = titleController.text;
    final entereredAmount = double.parse(amountController.text);

    if (entereredTitle.isEmpty || entereredAmount <= 0) {
      return;
    }
    widget.answerQuestionSubmitHandler(
      title: entereredTitle,
      amount: entereredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Title',
              ),
              onSubmitted: (_) => submitData(),
              // onChanged: (value) => titleInput = value,
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Amount',
              ),
              onSubmitted: (_) => submitData(),
              // onChanged: (value) => amountInput = value,
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            FlatButton(
              onPressed: submitData,
              child: Text('Add Transaction'),
              textColor: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
