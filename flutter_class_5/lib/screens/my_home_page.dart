import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> chatText = [];
  TextEditingController textFieldController = TextEditingController();
  TextEditingController updateTextFieldController = TextEditingController();
  // int indexUpdating = 0;
  // int isUpdating = 0;

  addChat() {
    setState(() {
      chatText.add(textFieldController.text);
      textFieldController.clear();
    });
    FocusManager.instance.primaryFocus?.unfocus();
  }

  removeChat(int index) {
    setState(() {
      chatText.removeAt(index);
    });
  }

  // editChat(int index) {
  //   setState(() {
  //     isUpdating = 1;
  //     indexUpdating = index;
  //     textFieldController.text = chatText[index];
  //   });
  // }

  // updateChat(int index) {
  //   setState(() {
  //     isUpdating = 0;
  //     indexUpdating = 0;
  //     chatText[index] = textFieldController.text;
  //     textFieldController.clear();
  //   });
  // }

  ediChatWithDialog(int index, String text) {
    updateTextFieldController.text = text;
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: const Text("Edit Chat"),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              child: TextField(
                controller: updateTextFieldController,
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () => closeDialog(),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () => updateChatWithDialog(index),
                child: const Text("Update"),
              ),
            ],
          );
        });
  }

  updateChatWithDialog(index) {
    setState(() {
      chatText[index] = updateTextFieldController.text;
      updateTextFieldController.clear();
      closeDialog();
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }

  closeDialog() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO APP"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextField(
                  controller: textFieldController,
                  decoration: const InputDecoration(
                    hintText: "Enter Item To Add",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child:
                    // isUpdating == 1
                    //     ? ElevatedButton(
                    //         onPressed: () => updateChat(indexUpdating),
                    //         child: const Text("Update Item"),
                    //         style: ButtonStyle(
                    //           backgroundColor:
                    //               MaterialStateProperty.all(Colors.orange),
                    //         ),
                    //       )
                    //     : ElevatedButton(
                    //         onPressed: () => addChat(),
                    //         child: const Text("Add Item"),
                    //       ),
                    ElevatedButton(
                  onPressed: () => addChat(),
                  child: const Text("Add Item"),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: chatText.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: Colors.lightGreen[100],
                    title: Text(chatText[index]),
                    trailing: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: Row(
                        children: [
                          IconButton(
                            // onPressed: () => editChat(index),
                            onPressed: () =>
                                ediChatWithDialog(index, chatText[index]),
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.orange,
                            ),
                          ),
                          IconButton(
                            onPressed: () => removeChat(index),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
