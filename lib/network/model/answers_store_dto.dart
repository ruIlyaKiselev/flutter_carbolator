import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class AnswersStoreDto {

  @JsonProperty(name: 'question_id')
  final int questionId;

  @JsonProperty(name: 'answers')
  final List<String> answers;

  AnswersStoreDto({
    required this.questionId,
    required this.answers
  });
}