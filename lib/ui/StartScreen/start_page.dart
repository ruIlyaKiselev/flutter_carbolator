import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:some_lessons_from_youtube/ui/GameScreen/game_page.dart';

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
        Row(
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
        whiteBoxContent(context),
        Container(
          height: 50,
        ),
      ]
  );
}

Widget whiteBoxContent(BuildContext context) {
  return  Expanded(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 50
      ),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const Text(
            "Привет! Это карболятор – калькулятор углеродного следа. Он делает то, это и тд, и тп.\nТекст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. Текст. ",
            style: TextStyle(
                fontFamily: "Montserrat",
                color: Color(0xFF4f4f4f),
                fontWeight: FontWeight.w600,
                fontSize: 20
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
              child: Container()
          ),
          SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameWidget()),
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
          )
        ],
      ),
    ),
  );
}