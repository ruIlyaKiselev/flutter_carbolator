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

class SendAnswersEvent extends QuestionEvent {}

class SendEmailEvent extends QuestionEvent {
  final String email;

  SendEmailEvent({
    required this.email
  });
}
