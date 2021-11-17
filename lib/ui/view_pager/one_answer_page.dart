import 'package:flutter/cupertino.dart';
import 'package:some_lessons_from_youtube/domain/question.dart';
import 'package:some_lessons_from_youtube/ui/view_pager/one_answer_item.dart';

class OneAnswerPage extends StatefulWidget {

  OneAnswerPage({Key? key, required this.currentQuestion}) : super(key: key);

  Question currentQuestion;
  String selectedString = "";

  @override
  State createState() => _OneAnswerPageState();
}

class _OneAnswerPageState extends State<OneAnswerPage> {

  // TODO: bug here!!!!!!!!!
  // _OneAnswerPageState() {
  //   widget.currentQuestion.questionList.forEach((element) {
  //     items.add(
  //         CustomRadioButton(
  //           size: 26,
  //           text: element,
  //           resetButtonsCallback: resetRadioButtons,
  //         )
  //     );
  //   });
  // }

  List<CustomRadioButton> items = [];

  void resetRadioButtons(String text) {
    setState(() {
      for (var element in items) {
        element.isSelected = false;
      }

      items.where((element) => element.text == text).first.isSelected = true;
      widget.selectedString = text;
    });

    rebuildAllChildren(context);

  }

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }
    (context as Element).visitChildren(rebuild);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.currentQuestion.text,
          style: const TextStyle(
              fontFamily: "Montserrat",
              color: Color(0xFF4f4f4f),
              fontWeight: FontWeight.w800,
              fontSize: 22
          ),
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return items[index];
            },
          ),
        )
      ],
    );
  }
}