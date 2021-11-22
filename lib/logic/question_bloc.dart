import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:some_lessons_from_youtube/domain/answer.dart';
import 'package:some_lessons_from_youtube/repository/carbolator_repository.dart';
import 'package:some_lessons_from_youtube/repository/carbolator_repository_impl.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {

  CarbolatorRepository repository = CarbolatorRepositoryImpl();
  Set<Answer> answers = {};

  QuestionBloc() : super(LoadingEvent()) {
    on<QuestionEvent>((event, emit) {
      if (event is NewAnswerEvent) {
        var answer = event.answer;
        answers.add(answer);
      }

    });
  }

  void postAnswers(List<Answer> answers) {

  }
}