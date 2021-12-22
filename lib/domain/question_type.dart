enum QuestionType {
  oneAnswer,
  multipleAnswer,
  selectorsAnswer,
  lastFieldAnswer
}

extension QuestionTypeFromString on String {
  QuestionType toQuestionType() {
    switch (this) {
      case "1": return QuestionType.oneAnswer;
      case "2": return QuestionType.multipleAnswer;
      case "3": return QuestionType.selectorsAnswer;
      case "4": return QuestionType.lastFieldAnswer;
      default: return QuestionType.oneAnswer;
    }
  }
}