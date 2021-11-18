import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinishWidget extends StatelessWidget {
  const FinishWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
          type: MaterialType.transparency,
          child: DecoratedBox(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/background2.png"), fit: BoxFit.fill),
              ),
              child: Container()
          )
      ),
    );
  }
}

Widget foregroundContent() {
  return Column(
    children: [

    ],
  );
}