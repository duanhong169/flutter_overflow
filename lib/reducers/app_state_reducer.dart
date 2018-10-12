import 'package:flutter_overflow/models/models.dart';
import 'package:flutter_overflow/reducers/loading_reducer.dart';
import 'package:flutter_overflow/reducers/selected_sort_type_reducer.dart';
import 'package:flutter_overflow/reducers/questions_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    selectedSortType: selectedSortTypeReducer(state.selectedSortType, action),
    questions: questionsReducer(state.questions, action),
  );
}