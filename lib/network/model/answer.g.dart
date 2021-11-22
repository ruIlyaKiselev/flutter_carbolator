// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionDtoItem _$QuestionDtoItemFromJson(Map<String, dynamic> json) =>
    QuestionDtoItem(
      id: json['id'] as int,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => AnswerComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextQuestionId: json['nextQuestionId'] as int,
      text: json['text'] as String,
      typeAnswer: json['typeAnswer'] as String,
    );

Map<String, dynamic> _$QuestionDtoItemToJson(QuestionDtoItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'answers': instance.answers,
      'nextQuestionId': instance.nextQuestionId,
      'text': instance.text,
      'typeAnswer': instance.typeAnswer,
    };

AnswerComponent _$AnswerComponentFromJson(Map<String, dynamic> json) =>
    AnswerComponent(
      nextQuestionId: json['nextQuestionId'] as int,
      text: json['text'] as String,
    );

Map<String, dynamic> _$AnswerComponentToJson(AnswerComponent instance) =>
    <String, dynamic>{
      'nextQuestionId': instance.nextQuestionId,
      'text': instance.text,
    };
