import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:some_lessons_from_youtube/ui/StartScreen/start_page.dart';

class GreetingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff006e91),
        body: InkWell(
            onTap: () => {
              Navigator.of(context).pushNamed(
                "/start"
              )
            },
            child: SizedBox(
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