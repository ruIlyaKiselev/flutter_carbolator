import 'package:flutter/cupertino.dart';
import 'package:some_lessons_from_youtube/domain/question.dart';
import 'package:some_lessons_from_youtube/ui/view_pager/selector_answer_item.dart';

class SelectorAnswerPage extends StatefulWidget {

  SelectorAnswerPage({Key? key, required this.currentQuestion}) : super(key: key) {
    currentQuestion.questionList.forEach((element) {
      items.add(
          CustomSelector(
            size: 26,
            min: 0,
            max: 10,
            text: element,
            secondText: "",
          )
      );
    });
  }

  Question currentQuestion;
  List<CustomSelector> items = [];

  @override
  State createState() => _SelectorAnswerPageState();
}

class _SelectorAnswerPageState extends State<SelectorAnswerPage> {

  void resetRadioButtons(String text) {
    setState(() {
      for (var element in widget.items) {
        element.isSelected = false;
      }

      widget.items.where((element) => element.text == text).first.isSelected = true;
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
            itemCount: widget.items.length,
            itemBuilder: (BuildContext context, int index) {
              return widget.items[index];
            },
          ),
        )
      ],
    );
  }
}