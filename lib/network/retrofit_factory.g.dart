// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrofit_factory.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://62.84.122.233:8085/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<QuestionDtoItem>> getAllQuestions(
      hostHeaderValue, acceptHeaderValue) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Host': hostHeaderValue,
      r'Accept': acceptHeaderValue
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<QuestionDtoItem>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'questions/all',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => QuestionDtoItem.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<AnswerDtoItem>> postAnswers(
      hostHeaderValue, acceptHeaderValue, answers) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Host': hostHeaderValue,
      r'Accept': acceptHeaderValue
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = answers.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<AnswerDtoItem>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'questions/create',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => AnswerDtoItem.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
