import 'package:redux/redux.dart';
import 'package:flutter_overflow/models/models.dart';
import 'package:flutter_overflow/actions/actions.dart';

final questionsReducer = combineReducers<List<Question>>([
  TypedReducer<List<Question>, QuestionsLoadedAction>(_questionsLoaded),
  TypedReducer<List<Question>, QuestionsNotLoadedAction>(_questionsNotLoaded),
]);

List<Question> _questionsLoaded(List<Question> questions, QuestionsLoadedAction action) {
  if (action.append) {
    return List.from(questions)
      ..addAll(action.questions);
  } else {
    return List.from(action.questions);
  }
}

List<Question> _questionsNotLoaded(List<Question> questions, QuestionsNotLoadedAction action) {
  return questions;
}