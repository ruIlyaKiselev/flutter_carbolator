import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:some_lessons_from_youtube/logic/question_bloc.dart';

class StartWidget extends StatelessWidget {
  const StartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/background1.png"), fit: BoxFit.cover),
            ),
            child: foregroundContent(context)
        )

    );
  }
}

Widget foregroundContent(BuildContext context) {
  return Column(
      children: [
        Container(
          height: 75,
        ),
        const Text(
          "КАРБОЛЯТОР",
          style: TextStyle(
              fontFamily: "Montserrat",
              color: Color(0xFF4f4f4f),
              fontWeight: FontWeight.w800,
              fontSize: 40
          ),
        ),
        const Text(
          "УГЛЕРОДНЫЙ КАЛЬКУЛЯТОР",
          style: TextStyle(
              fontFamily: "Montserrat",
              color: Color(0xFF4f4f4f),
              fontWeight: FontWeight.w800,
              fontSize: 20
          ),
        ),
        Container(
            height: 20
        ),
        Container(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.height),
          child: Row(
              children: [
                Expanded(
                    child: Container()
                ),
                Image.asset(
                  "assets/bear.png",
                  width: 150,
                  height: 94,
                ),
                Container(
                    width: 50
                )
              ]
          ),
        ),
        whiteBoxContent(context),
        Container(
          height: 50,
        ),
      ]
  );
}

Widget whiteBoxContent(BuildContext context) {
  String _emailText = "";

  return  Expanded(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.height),
      margin: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 10
      ),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    const Text(
                      "Привет! Это карболятор – калькулятор углеродного следа.",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Color(0xFF4f4f4f),
                          fontWeight: FontWeight.w600,
                          fontSize: 20
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),
                    Image.asset("assets/1.jpg"),
                    const SizedBox(height: 25),
                    Image.asset("assets/2.jpg"),
                    const SizedBox(height: 25),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: TextField(
                        onChanged: (String value) => {
                          _emailText = value
                        },
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          isDense: true,
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "Введите email для отправки результатов (опционально)",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 200),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: TextButton(
                      onPressed: () => {
                        context.read<QuestionBloc>()
                          ..add(SendEmailEvent(email: _emailText)),
                        Navigator.of(context).pushReplacementNamed(
                            "/game"
                        )
                      },
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: const Color(0xFF4f4f4f),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          )
                      ),
                      child: const Text(
                        "Узнать свой углеродный след",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 17
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}