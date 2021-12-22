import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class AnswerDto {

  @JsonProperty(name: 'next_question_id')
  final int nextQuestionId;

  @JsonProperty(name: 'text')
  final String text;

  AnswerDto({
    required this.nextQuestionId,
    required this.text
  });
}