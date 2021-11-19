import 'package:json_annotation/json_annotation.dart';

part 'answer.g.dart';

class QuestionsDto {

}

@JsonSerializable()
class QuestionDtoItem {

  QuestionDtoItem({
    required this.id,
    required this.answers,
    required this.nextQuestionId,
    required this.text,
    required this.typeAnswer
  });

  int id;
  List<AnswerComponent> answers;
  int nextQuestionId;
  String text;
  String typeAnswer;

  factory QuestionDtoItem.fromJson(Map<String, dynamic> json) => _$QuestionDtoItemFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionDtoItemToJson(this);
}

@JsonSerializable()
class AnswerComponent {

  AnswerComponent({
    required this.nextQuestionId,
    required this.text
  });

  int nextQuestionId;
  String text;

  factory AnswerComponent.fromJson(Map<String, dynamic> json) => _$AnswerComponentFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerComponentToJson(this);
}