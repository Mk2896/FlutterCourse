import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  bool obsecureText = true;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Login App'),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.lightGreen,
        child: Center(
          child: Container(
            width: 350,
            height: 350,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 3,
              ),
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  enableSuggestions: false,
                  autocorrect: false,
                  cursorColor: Colors.black87,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
                    alignLabelWithHint: true,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: "Email Address",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.white),
                    fillColor: Colors.black87,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  enableSuggestions: false,
                  autocorrect: false,
                  cursorColor: Colors.black87,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  obscureText: widget.obsecureText,
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
                      alignLabelWithHint: true,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: "Password",
                      labelStyle:
                          const TextStyle(fontSize: 20, color: Colors.white),
                      fillColor: Colors.black87,
                      suffixIcon: IconButton(
                        icon: Icon(
                          widget.obsecureText
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          if (widget.obsecureText == true) {
                            setState(() {
                              widget.obsecureText = false;
                            });
                          } else {
                            setState(() {
                              widget.obsecureText = true;
                            });
                          }
                        },
                      )),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(onPressed: () {}, child: const Text('Login Me'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
