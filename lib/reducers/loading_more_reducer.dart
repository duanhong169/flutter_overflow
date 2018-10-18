import 'package:redux/redux.dart';
import 'package:flutter_overflow/actions/actions.dart';

final loadingMoreReducer = combineReducers<bool>([
  TypedReducer<bool, QuestionsLoadedAction>(_setLoaded),
  TypedReducer<bool, QuestionsNotLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
  return false;
}
