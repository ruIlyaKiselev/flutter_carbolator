import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_lessons_from_youtube/logic/question_bloc.dart';
import 'package:some_lessons_from_youtube/ui/finish_screen/results_list_item.dart';

class FinishWidget extends StatefulWidget {
  const FinishWidget({Key? key}) : super(key: key);

  @override
  State<FinishWidget> createState() => _FinishWidgetState();
}

class _FinishWidgetState extends State<FinishWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionBloc, QuestionState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Material(
              type: MaterialType.transparency,
              child: DecoratedBox(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/background2.png"),
                        fit: BoxFit.fill
                    ),
                  ),
                  child: state is AnswersDeliveredSuccessfullyState ?
                  foregroundContent(state.results) :
                  const Center(child: CircularProgressIndicator())
              )
          ),
        );
      },
    );
  }
}

Widget foregroundContent(List<String> values) {
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
            width: 180,
          ),
        ],
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(48.0),
              child: Text(
                "${values[0]} т",
                style: const TextStyle(
                    fontFamily: "Montserrat",
                    color: Color(0xFF4f4f4f),
                    fontWeight: FontWeight.w800,
                    fontSize: 40
                ),
              ),
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_1.png", text: "${values[1]} т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_2.png", text: "${values[2]} т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_3.png", text: "${values[3]} т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_4.png", text: "${values[4]} т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_5.png", text: "${values[5]} т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_6.png", text: "${values[6]} т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_7.png", text: "${values[7]} т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_8.png", text: "${values[8]} т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_9.png", text: "${values[9]} т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_10.png", text: "${values[10]} т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_11.png", text: "${values[11]} т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_12.png", text: "${values[12]} т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_13.png", text: "${values[13]} т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_14.png", text: "${values[14]} т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_15.png", text: "${values[15]} т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_16.png", text: "${values[16]} т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_17.png", text: "${values[17]} т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_18.png", text: "${values[18]} т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_19.png", text: "${values[19]} т"
            ),
            ResultListItem(
                imageName: "assets/result_screen_icon_20.png", text: "${values[20]} т"
            ),
            Container(
              padding: const EdgeInsets.all(16),
              constraints: const BoxConstraints(maxWidth: 400),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Image.asset("assets/social1.png"),
                    onPressed: () => {},
                  ),
                  IconButton(
                    icon: Image.asset("assets/social2.png"),
                    onPressed: () => {},
                  ),
                  IconButton(
                    icon: Image.asset("assets/social3.png"),
                    onPressed: () => {},
                  ),
                  IconButton(
                    icon: Image.asset("assets/social4.png"),
                    onPressed: () => {},
                  )
                ],
              ),

            )
          ],
        ),
      ),
    ],
  );
}