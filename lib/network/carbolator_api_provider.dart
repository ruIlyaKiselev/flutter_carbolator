import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:logger/logger.dart';
import 'package:some_lessons_from_youtube/network/api_provider.dart';
import 'package:some_lessons_from_youtube/network/model/question_dto.dart';

import 'model/answers_store_dto.dart';

class CarbolatorApiProvider {
  CarbolatorApiProvider();

  final Logger logger = Logger();
  final api = ApiProvider();

  Future<List<QuestionDto>?> getQuestions() async {
    logger.d("getQuestions requesting");
    final saveRequest = await api.get("/questions");
    logger.d("getQuestions response: ${saveRequest?.statusCode}");
    return JsonMapper.fromMap<List<QuestionDto>>(saveRequest?.data);
  }

  Future<List<String>?> postAnswers(List<AnswersStoreDto> answers) async {
    logger.d("postAnswers requesting");
    final saveRequest = await api.post("/answers", JsonMapper.serialize(answers));
    logger.d("postAnswers response: ${saveRequest?.statusCode}");
    return JsonMapper.deserialize<List<String>>(saveRequest?.data);
  }
}
