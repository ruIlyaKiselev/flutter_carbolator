// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerDtoItem _$AnswerDtoItemFromJson(Map<String, dynamic> json) =>
    AnswerDtoItem(
      answers:
          (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
      questionId: json['questionId'] as int,
    );

Map<String, dynamic> _$AnswerDtoItemToJson(AnswerDtoItem instance) =>
    <String, dynamic>{
      'answers': instance.answers,
      'questionId': instance.questionId,
    };
