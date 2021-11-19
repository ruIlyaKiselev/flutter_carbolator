import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

class AnswerDto {

}

@JsonSerializable()
class AnswerDtoItem {

  AnswerDtoItem({
    required this.answers,
    required this.questionId
  });

  List<String> answers;
  int questionId;

  factory AnswerDtoItem.fromJson(Map<String, dynamic> json) => _$AnswerDtoItemFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerDtoItemToJson(this);
}