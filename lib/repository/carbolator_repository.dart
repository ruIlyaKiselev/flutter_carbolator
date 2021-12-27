import 'package:some_lessons_from_youtube/domain/answer.dart';
import 'package:some_lessons_from_youtube/domain/question.dart';
import 'package:some_lessons_from_youtube/network/model/answers_store_dto.dart';

abstract class CarbolatorRepository {
  Future<List<Question>?> getQuestions();
  Future<List<String>> postAnswers(List<Answer> answers);

  Future<Question?> getQuestionById(int questionId);
}