import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:some_lessons_from_youtube/domain/answer.dart';
import 'package:some_lessons_from_youtube/domain/question_type.dart';
import 'package:some_lessons_from_youtube/repository/carbolator_repository.dart';
import 'package:some_lessons_from_youtube/repository/carbolator_repository_impl.dart';
import 'package:some_lessons_from_youtube/ui/view_pager/Pages/abstract_answer_page.dart';
import 'package:some_lessons_from_youtube/ui/view_pager/Pages/lastfield_answer_page.dart';
import 'package:some_lessons_from_youtube/ui/view_pager/Pages/multiple_answer_page.dart';
import 'package:some_lessons_from_youtube/ui/view_pager/Pages/one_answer_page.dart';
import 'package:some_lessons_from_youtube/ui/view_pager/Pages/selector_answer_page.dart';

class GameWidget extends StatelessWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
          type: MaterialType.transparency,
          child: DecoratedBox(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/background3.png"), fit: BoxFit.cover),
              ),
              child: foregroundContent()
          )
      ),
    );
  }
}

Widget foregroundContent() {
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
        whiteBoxContent(),
        Container(
          height: 50,
        ),
      ]
  );
}

Widget whiteBoxContent() {

  ExamplePageView _pageView = ExamplePageView();

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
          Expanded(child: _pageView),
          bottomButtons(_pageView.controller)
        ],
      ),
    ),
  );
}

Widget bottomButtons(PageController pageController) {
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
          pageController.previousPage(duration: const Duration(microseconds: 1000), curve: Curves.linear)
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
          pageController.nextPage(duration: const Duration(microseconds: 1000), curve: Curves.linear)
        },
        child: Image.asset(
          "assets/chevronnext.png",
          scale: 3,
        ),
      ),
    ],
  );
}

class ExamplePageView extends StatelessWidget {

  ExamplePageView({Key? key}) : super(key: key);

  CarbolatorRepository repository = CarbolatorRepositoryImpl();

  late final PageController _controller = PageController(initialPage: 0);
  PageController get controller => _controller;

  @override
  Widget build(BuildContext context) {

    List<Widget> widgets = [];

    repository.getQuestions().forEach((element) {
      switch (element.questionType) {
        case QuestionType.oneAnswer:
          widgets.add(OneAnswerPage(currentQuestion: element));
          break;
        case QuestionType.multipleAnswer:
          widgets.add(MultipleAnswerPage(currentQuestion: element));
          break;
        case QuestionType.selectorsAnswer:
          widgets.add(SelectorAnswerPage(currentQuestion: element));
          break;
        case QuestionType.lastFieldAnswer:
          widgets.add(LastFieldAnswerPage(currentQuestion: element));
          break;
      }
    });

    void collectAnswers() {

      List<AbstractAnswerPage> pagesProvider = [];
      List<Answer> answers = [];

      widgets.forEach((element) {
        pagesProvider.add(element as AbstractAnswerPage);
      });

      pagesProvider.forEach((element) {
        answers.add(
          Answer(
              id: element.getId(),
              selectedAnswers: element.getAnswers()
          )
        );
      });

      answers.forEach((element) {
        print("${element.id}: ${element.selectedAnswers}");
      });
    }

    return Stack(
      children: [
        TextButton(
            onPressed: () => {},
            child: Container()
        ),
        PageView(
            onPageChanged: (int page) => {
              collectAnswers(),
            },
            scrollDirection: Axis.horizontal,
            controller: _controller,
            children: widgets
        )
      ],
    );
  }
}