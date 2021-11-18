class AnswerDto {

}

class AnswerDtoItem {

  AnswerDtoItem({
    required this.answers,
    required this.questionId
  });

  List<String> answers;
  int questionId;
}