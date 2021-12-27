part of 'question_bloc.dart';

@immutable
abstract class QuestionState {}

class LoadingState extends QuestionState {}

class LoadedState extends QuestionState {}

class ErrorState extends QuestionState {}

class QuestionLoadedState extends QuestionState {
  final Question question;
  final List<String>? storedAnswers;

  QuestionLoadedState({
    required this.question,
    required this.storedAnswers,
  });
}

class QuestionsFinishedState extends QuestionState {}

class AnswerAcceptedState extends QuestionState {}

class AnswersDeliveredSuccessfullyState extends QuestionState {
  final List<String> results;

  AnswersDeliveredSuccessfullyState({
    required this.results
  });
}

class AnswersDeliveredUnsuccessfullyState extends QuestionState {}

class EmailDeliveredSuccessfullyState extends QuestionState {}

class EmailDeliveredUnsuccessfullyState extends QuestionState {}