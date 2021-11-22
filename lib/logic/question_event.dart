part of 'question_bloc.dart';

@immutable
abstract class QuestionEvent {}

class NewAnswerEvent extends QuestionEvent {
  Answer answer;

  NewAnswerEvent({required this.answer});
}