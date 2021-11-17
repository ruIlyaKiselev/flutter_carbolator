import 'package:some_lessons_from_youtube/domain/question_type.dart';

class Question {
  int id;
  String text;
  List<String> questionList;
  QuestionType questionType;
  int nextQuestionId;

  Question({
    required this.id,
    required this.text,
    required this.questionList,
    required this.questionType,
    required this.nextQuestionId
  });

}