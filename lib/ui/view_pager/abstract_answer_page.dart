import 'package:flutter/cupertino.dart';
import 'package:some_lessons_from_youtube/domain/question.dart';

class AbstractAnswerPage {
  AbstractAnswerPage({Key? key, required this.currentQuestion});
  Question currentQuestion;
}