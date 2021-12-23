part of 'question_bloc.dart';

@immutable
abstract class QuestionState {}

class LoadingState extends QuestionState {}

class LoadedState extends QuestionState {}

class ErrorState extends QuestionState {}

class QuestionLoadedState extends QuestionState {
  final Question question;

  QuestionLoadedState({
    required this.question
  });
}

class QuestionsFinishedState extends QuestionState {}

class AnswerAcceptedState extends QuestionState {

}

class AnswersDeliveredSuccessfullyState extends QuestionState {}

class AnswersDeliveredUnsuccessfullyState extends QuestionState {}