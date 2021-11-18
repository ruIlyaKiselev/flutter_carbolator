import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:some_lessons_from_youtube/ui/FinishScreen/results_list_item.dart';

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
              child: foregroundContent()
          )
      ),
    );
  }
}

Widget foregroundContent() {
  return Stack(
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 200,
          ),
          Image.asset(
            "assets/iceberg3.png",
            width: 200,
          ),
        ],
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(48.0),
              child: Text(
                "23.01 т",
                style: TextStyle(
                    fontFamily: "Montserrat",
                    color: Color(0xFF4f4f4f),
                    fontWeight: FontWeight.w800,
                    fontSize: 40
                ),
              ),
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_1.png", text: "0.00 т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_2.png", text: "0.00 т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_3.png", text: "0.00 т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_4.png", text: "0.00 т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_5.png", text: "0.00 т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_6.png", text: "0.00 т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_7.png", text: "0.00 т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_8.png", text: "0.00 т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_9.png", text: "0.00 т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_10.png", text: "0.00 т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_11.png", text: "0.00 т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_12.png", text: "0.00 т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_13.png", text: "0.00 т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_14.png", text: "0.00 т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_15.png", text: "0.00 т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_16.png", text: "0.00 т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_17.png", text: "0.00 т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_18.png", text: "0.00 т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_19.png", text: "0.00 т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_20.png", text: "0.00 т"
            ),
          ],
        ),
      ),
    ],
  );
}