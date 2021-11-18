import 'package:retrofit/http.dart';
import 'package:some_lessons_from_youtube/network/api_contract.dart';
import 'package:some_lessons_from_youtube/network/model/answer.dart';

import 'model/question.dart';


@RestApi(baseUrl: ApiContract.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("questions/all")
  Future<List<QuestionDtoItem>> getAllQuestions();

  @POST("questions/create")
  void postAnswers(List<AnswerDtoItem> answers);
}