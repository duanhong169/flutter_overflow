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

  final fetchQuestions = _createFetchQuestions(questionRepo);

  return [
    TypedMiddleware<AppState, LoadQuestionsAction>(fetchQuestions)
  ];
}

Middleware<AppState> _createFetchQuestions(QuestionsRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.fetchQuestions(action.params).then(
          (questions) {
            store.dispatch(
              QuestionsLoadedAction(
                questions.map(Question.fromEntity).toList(),
                append: action.params["page"] != 1,
              ),
            );
            action.completer.complete(true);
          },
    ).catchError((_) {
        store.dispatch(QuestionsNotLoadedAction());
        action.completer.complete(false);
    });

    next(action);
  };
}