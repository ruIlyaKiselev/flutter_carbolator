import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Center(
        child: MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: const Text("Some title"),
                backgroundColor: Colors.green
              ),
              body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Text1"),
                      const Text("Text2"),
                      const Text("Text3"),
                      const Text("Text4"),
                      const Text("Text5"),
                      TextButton(
                        onPressed: () => {
                          // print("new event")
                          Fluttertoast.showToast(
                          msg: "new event",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                          )
                        },
                        child: const Text("Press Button"),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          textStyle: const TextStyle(
                            fontSize: 30
                          ),
                          primary: Colors.white
                        ),
                      )
                    ],

                  )
              ),
            )
        )
    );
  }
}
