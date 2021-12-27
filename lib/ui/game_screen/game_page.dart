import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:some_lessons_from_youtube/domain/answer.dart';
import 'package:some_lessons_from_youtube/domain/question_type.dart';
import 'package:some_lessons_from_youtube/logic/question_bloc.dart';
import 'package:some_lessons_from_youtube/ui/view_pager/Pages/lastfield_answer_page.dart';
import 'package:some_lessons_from_youtube/ui/view_pager/Pages/multiple_answer_page.dart';
import 'package:some_lessons_from_youtube/ui/view_pager/Pages/one_answer_page.dart';
import 'package:some_lessons_from_youtube/ui/view_pager/Pages/selector_answer_page.dart';

class GameWidget extends StatelessWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<QuestionBloc>().add(NextQuestionEvent());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
          type: MaterialType.transparency,
          child: DecoratedBox(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/background1beta.png"), fit: BoxFit.fill),
              ),
              child: foregroundContent(context)
          )
      ),
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
        whiteBoxContent(context),
        Container(
          height: 50,
        ),
      ]
  );
}

Widget whiteBoxContent(BuildContext context) {

  QuestionsWidget _questionsWidget = QuestionsWidget(buildContext: context);

  return BlocBuilder<QuestionBloc, QuestionState>(
    builder: (questionContext, questionState) {
      if (questionState is! QuestionsFinishedState) {
        return Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.height),
            margin: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 10
            ),
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(16)
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: _questionsWidget
                ),
                bottomButtons(context)
              ],
            ),
          ),
        );
      } else {
        return Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 10
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(
                    child: SizedBox()
                ),
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 300),
                  padding: const EdgeInsets.only(
                      left: 16,
                      right: 16
                  ),
                  child: TextButton(
                    onPressed: () => {
                      Navigator.of(context).pushReplacementNamed(
                          "/finish"
                      ),
                      context.read<QuestionBloc>()
                        ..add(SendAnswersEvent())
                    },
                    style: TextButton.styleFrom(
                        primary: const Color(0xFF4f4f4f),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
                    child: const Text(
                      "Рассчитать",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Color(0xFF4f4f4f),
                          fontWeight: FontWeight.w600,
                          fontSize: 17
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      bottom: 10
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        primary: Colors.white
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: const Text(
                        "Вернуться к вопросам",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                    onPressed:() => {
                      context.read<QuestionBloc>().add(PrevQuestionEvent())
                    },
                  ),
                ),
                const Expanded(
                    child: SizedBox()
                ),
              ],
            ),
          ),
        );
      }
    },
  );
}

Widget bottomButtons(BuildContext context) {
  return Row(
    children: [
      TextButton(
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xFF4f4f4f),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () => {
          context.read<QuestionBloc>().add(PrevQuestionEvent())
        },
        child: Image.asset(
          "assets/chevronprev.png",
          scale: 3,
        ),
      ),
      Expanded(child: Container()),
      TextButton(
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xFF4f4f4f),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () => {
          context.read<QuestionBloc>().add(NextQuestionEvent())
        },
        child: Image.asset(
          "assets/chevronnext.png",
          scale: 3,
        ),
      ),
    ],
  );
}

class QuestionsWidget extends StatefulWidget {
  final BuildContext buildContext;

  const QuestionsWidget({
    Key? key,
    required this.buildContext
  }) : super(key: key);

  @override
  State<QuestionsWidget> createState() => _QuestionsWidgetState();
}

class _QuestionsWidgetState extends State<QuestionsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionBloc, QuestionState>(
      builder: (questionContext, questionState) {
        if (questionState is QuestionLoadedState) {
          switch (questionState.question.questionType) {
            case QuestionType.oneAnswer: return OneAnswerPage(
              currentQuestion: questionState.question,
              answersCallback: ({required int id, required List<String> selectedAnswers}) =>
                  context.read<QuestionBloc>().add(
                      NewAnswerEvent(
                          answer: Answer(
                              id: id,
                              selectedAnswers: selectedAnswers
                          )
                      ),
                  ),
              storedAnswers: questionState.storedAnswers ?? []
            );
            case QuestionType.multipleAnswer: return MultipleAnswerPage(
              currentQuestion: questionState.question,
              answersCallback: ({required int id, required List<String> selectedAnswers}) =>
                  context.read<QuestionBloc>().add(
                      NewAnswerEvent(
                          answer: Answer(
                              id: id,
                              selectedAnswers: selectedAnswers
                          )
                      )
                  ),
              storedAnswers: questionState.storedAnswers ?? []
            );
            case QuestionType.selectorsAnswer: return SelectorAnswerPage(
                currentQuestion: questionState.question,
                answersCallback: ({required int id, required List<String> selectedAnswers}) =>
                    context.read<QuestionBloc>().add(
                        NewAnswerEvent(
                            answer: Answer(
                                id: id,
                                selectedAnswers: selectedAnswers
                            )
                        )
                    ),
              storedAnswers: questionState.storedAnswers ?? []
            );
            case QuestionType.lastFieldAnswer: return LastFieldAnswerPage(
                currentQuestion: questionState.question,
                answersCallback: ({required int id, required List<String> selectedAnswers}) =>
                context.read<QuestionBloc>().add(
                    NewAnswerEvent(
                        answer: Answer(
                            id: id,
                            selectedAnswers: selectedAnswers
                        )
                    )
                ),
              storedAnswers: questionState.storedAnswers ?? []
            );
          }
        }
        return const SizedBox();
      },
    );
  }
}