part of 'question_bloc.dart';

@immutable
abstract class QuestionState {}

class LoadingEvent extends QuestionState {}

class LoadedEvent extends QuestionState {}
