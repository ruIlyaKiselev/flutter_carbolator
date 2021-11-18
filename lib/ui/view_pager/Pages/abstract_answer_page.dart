import 'package:flutter/cupertino.dart';
import 'package:some_lessons_from_youtube/domain/question.dart';

abstract class AbstractAnswerPage {
  List<String> getAnswers();
  int getId();
}