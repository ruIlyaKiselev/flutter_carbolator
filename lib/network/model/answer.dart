class QuestionsDto {

}

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
}

class AnswerComponent {

  AnswerComponent({
    required this.nextQuestionId,
    required this.text
  });

  int nextQuestionId;
  String text;
}