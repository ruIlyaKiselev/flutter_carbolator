
import 'dart:math';

import 'package:some_lessons_from_youtube/domain/answer.dart';
import 'package:some_lessons_from_youtube/domain/question.dart';
import 'package:some_lessons_from_youtube/domain/question_type.dart';
import 'package:some_lessons_from_youtube/network/carbolator_api_provider.dart';
import 'package:some_lessons_from_youtube/network/model/answers_store_dto.dart';
import 'package:some_lessons_from_youtube/repository/carbolator_repository.dart';

class CarbolatorRepositoryImpl implements CarbolatorRepository {

  List<Question>? _questionList = [];
  final CarbolatorApiProvider _apiProvider = CarbolatorApiProvider();

  @override
  Future<List<Question>?> getQuestions() async {
    if (_questionList?.isEmpty ?? true) {
      _questionList = await _generateTestQuestions();
      // _questionList = await _getQuestionsFromApi();
    }

    return _questionList;
  }

  @override
  Future<List<String>> postAnswers(List<Answer> answers) async {
    // return await _postAnswersToApi(answers);
    return await _postAnswersGenerated(answers);
  }

  @override
  Future<Question?> getQuestionById(int questionId) async {
    var questions = await getQuestions();
    return questions?.firstWhere((element) => element.id == questionId);
  }

  Future<List<Question>?> _getQuestionsFromApi() async {
    var resultFromApi = await _apiProvider.getQuestions();
    return resultFromApi?.map((e) => Question(
      id: e.id,
      text: e.text,
      questionList: e.answers.map((e) => e.text).toList(),
      questionType: e.typeAnswer.toQuestionType(),
      prevQuestionId: resultFromApi.where((element) => e.nextQuestionId == e.id).first.id,
      nextQuestionId: e.nextQuestionId,
      nextQuestionMap: {
        for (var item in e.answers)
          item.text : item.nextQuestionId
      },
    )).toList();
  }

  Future<List<Question>?> _generateTestQuestions() async {
    await Future.delayed(const Duration(seconds: 1));
    List<Question> result = [
      Question(
          id: 1,
          text: "Какие у вас пищевые привычки?",
          questionList: [
            "Мясо с каждым приемом пищи",
            "Мясо иногда",
            "Не ем говядину",
            "Ем мясо очень редко",
            "Я вегетарианец",
            "Я веган"
          ],
          questionType: QuestionType.oneAnswer,
          prevQuestionId: 1,
          nextQuestionId: 2,
          nextQuestionMap: {}
      ),
      Question(
          id: 2,
          text: "Какие из следующих ресурсосберегающих приспособлений установлены в вашем доме?",
          questionList: [
            "Энергосберегающие лампочки",
            "Утеплитель крыши",
            "Утеплитель стен и межпанельных швов",
            "Конденсирующий водонагреватель",
            "Двойное остекление",
            "Насадки для ослабления напора воды",
            "Солнечные панели",
            "Солнечные нагреватели воды"
          ],
          questionType: QuestionType.multipleAnswer,
          prevQuestionId: 1,
          nextQuestionId: 3,
          nextQuestionMap: {}
      ),
      Question(
          id: 3,
          text: "Сколько рейсов туда–обратно вы совершили в течение прошедшего года на следующие расстояния?",
          questionList: [
            "До 500 км (как Москва–Воронеж)",
            "До 1250 км (как Москва–Архангельск)",
            "До 2500 км (как Москва–Амстердам)",
            "До 5500 км (как Москва–Иркутск)",
            "До 9000 км (как Москва–Владивосток)",
            "До 17500 км (как Москва–Веллингтон)"
          ],
          questionType: QuestionType.selectorsAnswer,
          prevQuestionId: 2,
          nextQuestionId: 4,
          nextQuestionMap: {}
      ),
      Question(
          id: 4,
          text: "Сколько ...?",
          questionList: [
            "50",
            "100",
            "150",
            "Другое"
          ],
          questionType: QuestionType.lastFieldAnswer,
          prevQuestionId: 3,
          nextQuestionId: 4,
          nextQuestionMap: {}
      )
    ];

    return result;
  }

  Future<List<String>> _postAnswersToApi(List<Answer> answers) async {
    var result = await _apiProvider.postAnswers(answers.map((e) =>
        AnswersStoreDto(
            questionId: e.id,
            answers: e.selectedAnswers
        )
    ).toList());

    return result ?? [];
  }

  Future<List<String>> _postAnswersGenerated(List<Answer> answers) async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      "23.01",
      "2.00",
      "1.01",
      "1.00",
      "1.50",
      "2.00",
      "0.50",
      "1.00",
      "1.00",
      "1.33",
      "2.00",
      "1.00",
      "0.66",
      "1.20",
      "1.40",
      "0.80",
      "0.90",
      "0.70",
      "1.00",
      "0.00",
      "1.00"
    ];
  }

}