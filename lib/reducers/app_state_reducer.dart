import 'package:flutter_overflow/models/models.dart';
import 'loading_reducer.dart';
import 'selected_sort_type_reducer.dart';
import 'questions_reducer.dart';
import 'loading_more_reducer.dart';
import 'page_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoadingQuestions: loadingReducer(state.isLoadingQuestions, action),
    selectedSortType: selectedSortTypeReducer(state.selectedSortType, action),
    questions: questionsReducer(state.questions, action),
    isLoadingMoreQuestions: loadingMoreReducer(state.isLoadingMoreQuestions, action),
    questionsPage: pageReducer(state.questionsPage, action),
  );
}