part of 'question_bloc.dart';

@immutable
abstract class QuestionEvent {}

class QuestionsFetchedEvent extends QuestionEvent {}

class NextQuestionEvent extends QuestionEvent {}

class PrevQuestionEvent extends QuestionEvent {}

class NewAnswerEvent extends QuestionEvent {
  final Answer answer;

  NewAnswerEvent({
    required this.answer
  });
}

class SendAnswersEvent extends QuestionEvent {
  final List<Answer> answers;

  SendAnswersEvent({
    required this.answers
  });
}