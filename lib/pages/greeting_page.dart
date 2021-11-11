import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: const Color(0xff006e91),
            appBar: null,
            body: SingleChildScrollView(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Center(
                              child: Image.asset(
                                "assets/greeting_image.png",
                                width: 250,
                                height: 250,
                              )
                          )
                      ),
                    ]
                )
            )

        )
    );
  }
}