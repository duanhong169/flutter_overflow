import 'package:redux/redux.dart';
import 'package:flutter_overflow/actions/actions.dart';

final pageReducer = combineReducers<int>([
  TypedReducer<int, QuestionsLoadedAction>(_setQuestionsPage),
]);

int _setQuestionsPage(int page, action) {
  return page + 1;
}