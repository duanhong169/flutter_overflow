import 'package:redux/redux.dart';
import 'package:flutter_overflow/models/models.dart';
import 'package:flutter_overflow/actions/actions.dart';
import 'package:flutter_overflow/repository/stack_overflow_repository.dart';

List<Middleware<AppState>> createStoreStackOverflowMiddleware([
  QuestionsRepository questionRepo
]) {
  if (questionRepo == null) {
    questionRepo = QuestionsServiceRepository();
  }

  final fetchQuestions = _createLoadQuestions(questionRepo);

  return [
    TypedMiddleware<AppState, LoadQuestionsAction>(fetchQuestions)
  ];
}

Middleware<AppState> _createLoadQuestions(QuestionsRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.fetchQuestions(null).then(
          (questions) {
            store.dispatch(
              QuestionsLoadedAction(
                questions.map(Question.fromEntity).toList(),
              ),
            );
          },
    ).catchError((_) => store.dispatch(QuestionsNotLoadedAction()));

    next(action);
  };
}