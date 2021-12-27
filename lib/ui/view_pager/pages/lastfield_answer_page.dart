import 'package:flutter/cupertino.dart';
import 'package:some_lessons_from_youtube/domain/question.dart';
import 'package:some_lessons_from_youtube/ui/view_pager/Items/abstract_custom_radio_button.dart';
import 'package:some_lessons_from_youtube/ui/view_pager/Items/lastfield_answer_item.dart';
import 'package:some_lessons_from_youtube/ui/view_pager/Items/one_answer_item.dart';
import 'package:some_lessons_from_youtube/ui/view_pager/Pages/abstract_answer_page.dart';


class LastFieldAnswerPage extends StatefulWidget with AbstractAnswerPage {

  Question currentQuestion;
  List<AbstractCustomRadioButton> items = [];
  Function({required int id, required List<String> selectedAnswers}) answersCallback;
  List<String> storedAnswers;

  LastFieldAnswerPage({
    Key? key,
    required this.currentQuestion,
    required this.answersCallback,
    required this.storedAnswers
  }) : super(key: key) {
    for (var element in currentQuestion.questionList) {
      if (int.tryParse(element) != null) {
        items.add(
            CustomRadioButton(
              size: 26,
              text: element,
              resetButtonsCallback: null,
              selected: storedAnswers.contains(element)
            )
        );
      } else {
        items.add(
            CustomRadioButtonWithText(
              size: 26,
              text: element,
              resetButtonsCallback: null,
              value: "",
              selected: storedAnswers.contains(element),
            )
        );
      }
    }
  }

  @override
  State createState() => _LastFieldAnswerPageState(items);

  @override
  List<String> getAnswers() {
    return [];
  }

  @override
  int getId() {
    return currentQuestion.id;
  }
}

class _LastFieldAnswerPageState extends State<LastFieldAnswerPage> {

  _LastFieldAnswerPageState(List<AbstractCustomRadioButton> items) {
    items.forEach((element) {
      if (element is CustomRadioButton) {
        element.resetButtonsCallback = resetRadioButtons;
      }
      if (element is CustomRadioButtonWithText) {
        element.resetButtonsCallback = resetRadioButtons;
      }
    });
  }

  void resetRadioButtons(String text) {
    setState(() {
      for (var element in widget.items) {
        element.unselect();
      }

      widget.items.where((element) => element.getText() == text).first.select();
    });

    rebuildAllChildren(context);

    widget.answersCallback.call(
        id: widget.currentQuestion.id,
        selectedAnswers: widget.items.where((element) => element.isSelected()).map((e) => e.getText()).toList()
    );
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
        // Text(
        //   widget.currentQuestion.text,
        //   style: const TextStyle(
        //       fontFamily: "Montserrat",
        //       color: Color(0xFF4f4f4f),
        //       fontWeight: FontWeight.w800,
        //       fontSize: 22
        //   ),
        //   textAlign: TextAlign.center,
        // ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.items.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Text(
                  widget.currentQuestion.text,
                  style: const TextStyle(
                      fontFamily: "Montserrat",
                      color: Color(0xFF4f4f4f),
                      fontWeight: FontWeight.w800,
                      fontSize: 22
                  ),
                  textAlign: TextAlign.center,
                );
              }
              return widget.items[index - 1];
            },
          ),
        )
      ],
    );
  }
}