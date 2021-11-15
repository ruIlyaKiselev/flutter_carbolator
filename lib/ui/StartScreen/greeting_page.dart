import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: const Color(0xff006e91),
            body: SizedBox(
                width: double.infinity,
                child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 150,
                      ),
                      Image.asset(
                        "assets/greeting_image.png",
                        width: 250,
                        height: 250,
                      ),
                      Expanded(
                          child: Container()
                      ),
                      const Text(
                          "КАРБОЛЯТОР",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Color(0xffcdf2ff),
                            fontWeight: FontWeight.w800,
                            fontSize: 40
                          ),
                      ),
                      Container(
                        height: 50,
                      ),
                    ]
                )
            )
        )
    );
  }
}