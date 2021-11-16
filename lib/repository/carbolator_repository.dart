import 'package:some_lessons_from_youtube/domain/answer.dart';
import 'package:some_lessons_from_youtube/domain/question.dart';

abstract class CarbolatorRepository {
  List<Question> getQuestions();
  void postAnswers(List<Answer> answers);
}