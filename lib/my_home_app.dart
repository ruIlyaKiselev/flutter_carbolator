import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({Key? key}) : super(key: key);

  @override
  _MyHomeAppState createState() => _MyHomeAppState();

}

class _MyHomeAppState extends State<MyHomeApp> {

  int _counter = 1;

  void increment() {
    setState(() {
      _counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
              title: const Text("Some title"),
              backgroundColor: Colors.green
          ),
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "$_counter",
                    key: ValueKey<int>(_counter),
                    style: const TextStyle(
                      fontSize: 50,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () => {
                      increment(),
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
    );
  }
}