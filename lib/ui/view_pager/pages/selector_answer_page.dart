import 'package:flutter/cupertino.dart';
import 'package:some_lessons_from_youtube/domain/question.dart';
import 'package:some_lessons_from_youtube/ui/view_pager/Items/selector_answer_item.dart';

import 'abstract_answer_page.dart';

class SelectorAnswerPage extends StatefulWidget with AbstractAnswerPage {

  Question currentQuestion;
  List<CustomSelector> items = [];
  Function({required int id, required List<String> selectedAnswers}) answersCallback;
  List<String> storedAnswers;

  SelectorAnswerPage({
    Key? key,
    required this.currentQuestion,
    required this.answersCallback,
    required this.storedAnswers
  }) : super(key: key) {
    currentQuestion.questionList.forEach((element) {
      items.add(
          CustomSelector(
            size: 26,
            min: 0,
            max: 999,
            text: element,
            secondText: "",
            resetButtonsCallback: null,
            storedValue: _getStoredValue(element, storedAnswers)
          )
      );
    });
  }

  @override
  State createState() => _SelectorAnswerPageState(items);

  @override
  List<String> getAnswers() {
    List<String> result = [];

    items.forEach((element) {
      result.add("${element.text}: ${element.currentNumber}");
    });

    return result;
  }

  @override
  int getId() {
    return currentQuestion.id;
  }

  int _getStoredValue(String text, List<String> storedValues) {
    int? result;

    storedValues.forEach((element) {
      if (element.startsWith(text)) {

        String substring = element.substring(element.indexOf(": ") + 2, element.length);
        result =  int.tryParse(substring);
      }
    });

    return result ?? 0;
  }
}

class _SelectorAnswerPageState extends State<SelectorAnswerPage> {

  _SelectorAnswerPageState(List<CustomSelector> items) {
    items.forEach((element) {
      element.resetButtonsCallback = resetRadioButtons;
    });
  }

  void resetRadioButtons() {
    widget.answersCallback.call(
        id: widget.currentQuestion.id,
        selectedAnswers: widget.items.map((e) => "${e.text}: ${e.currentNumber}").toList()
    );
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