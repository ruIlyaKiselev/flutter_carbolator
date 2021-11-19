import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:some_lessons_from_youtube/network/api_contract.dart';
import 'package:some_lessons_from_youtube/network/model/answer.dart';

import 'model/question.dart';

part 'retrofit_factory.g.dart';

@RestApi(baseUrl: ApiContract.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("questions/all")
  Future<List<QuestionDtoItem>> getAllQuestions(
      @Header(ApiContract.hostHeaderKey) hostHeaderValue,
      @Header(ApiContract.acceptHeaderKey) acceptHeaderValue
  );

  @POST("questions/create")
  Future<List<AnswerDtoItem>> postAnswers(
      @Header(ApiContract.hostHeaderKey) hostHeaderValue,
      @Header(ApiContract.acceptHeaderKey) acceptHeaderValue,
      @Body() List<AnswerDtoItem> answers
  );
}