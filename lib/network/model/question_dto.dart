
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:equatable/equatable.dart';

import 'answer_dto.dart';

@jsonSerializable
class QuestionDto extends Equatable {

  @JsonProperty(name: 'id')
  final int id;

  @JsonProperty(name: 'text')
  final String text;

  @JsonProperty(name: 'type_answer')
  final String typeAnswer;

  @JsonProperty(name: 'next_question_id')
  final int nextQuestionId;

  @JsonProperty(name: 'answers')
  final List<AnswerDto> answers;

  const QuestionDto({
    required this.id,
    required this.text,
    required this.typeAnswer,
    required this.nextQuestionId,
    required this.answers,
  });

  @override
  List<Object> get props => [id];
}

