import 'package:redux/redux.dart';
import 'package:flutter_overflow/actions/actions.dart';

final selectedSortTypeReducer = combineReducers<String>([
  TypedReducer<String, SelectSortTypeAction>(_setSortType),
]);

String _setSortType(String selectedSortType, SelectSortTypeAction action) {
  return action.sortType;
}