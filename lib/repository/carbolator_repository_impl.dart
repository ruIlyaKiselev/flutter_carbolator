import 'package:some_lessons_from_youtube/domain/answer.dart';
import 'package:some_lessons_from_youtube/domain/question.dart';
import 'package:some_lessons_from_youtube/domain/question_type.dart';
import 'package:some_lessons_from_youtube/repository/carbolator_repository.dart';

class CarbolatorRepositoryImpl implements CarbolatorRepository{

  List<Question> _questionList = [];

  @override
  List<Question> getQuestions() {
    if (_questionList.isEmpty) {
      _questionList = _generateTestQuestions();
    }

    return _questionList;
  }

  @override
  void postAnswers(List<Answer> answers) {
    // TODO: implement postAnswers
  }

  List<Question> _generateTestQuestions() {
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
          nextQuestionId: 2
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
          nextQuestionId: 3
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
          nextQuestionId: 4
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
          nextQuestionId: -1
      )
    ];

    return result;
  }

}