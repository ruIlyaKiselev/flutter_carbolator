
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:some_lessons_from_youtube/domain/answer.dart';
import 'package:some_lessons_from_youtube/domain/question.dart';
import 'package:some_lessons_from_youtube/domain/question_type.dart';
import 'package:some_lessons_from_youtube/repository/carbolator_repository.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {

  CarbolatorRepository _repository;
  List<Question> _questions = [];
  int currentQuestion = 0;
  Set<Answer> answers = {};

  QuestionBloc({
    required CarbolatorRepository carbolatorRepository
  })
      :
        _repository = carbolatorRepository,
        super(LoadingState()) {
    on<QuestionsFetchedEvent>(_onQuestionsFetched);
    on<NewAnswerEvent>(_onNewAnswer);
    on<SendAnswersEvent>(_onSendAnswers);
  }

  void _onQuestionsFetched(QuestionsFetchedEvent event, Emitter<QuestionState> state) async {
    emit(LoadingState());
    var questionsFromRepository = await _repository.getQuestions();
    if (questionsFromRepository != null && questionsFromRepository.isNotEmpty) {
      _questions = questionsFromRepository;
      emit(LoadedState());
    } else {
      emit(ErrorState());
    }
  }

  void _onNewAnswer(NewAnswerEvent event, Emitter<QuestionState> state) async {
    emit(
        QuestionLoadedState(
          question: Question(
            id: 0,
            text: "",
            questionList: [],
            questionType: QuestionType.oneAnswer,
            nextQuestionId: 0,
            nextQuestionMap: {}
          )
        )
    );
  }

  void _onSendAnswers(SendAnswersEvent event, Emitter<QuestionState> state) {

  }

}