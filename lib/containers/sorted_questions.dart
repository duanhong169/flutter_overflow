import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_overflow/models/models.dart';
import 'package:flutter_overflow/presentation/question_list.dart';
import 'package:redux/redux.dart';
import 'package:flutter_overflow/actions/actions.dart';
import 'package:flutter_overflow/helpers.dart';

class SortedQuestions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return RefreshIndicator(
          child: QuestionList(vm.questions, vm.onLoadMore),
          onRefresh: vm.onRefresh,
        );
      },
    );
  }
}

class _ViewModel {
  final List<Question> questions;
  final LoadMoreCallback onLoadMore;
  final RefreshCallback onRefresh;

  _ViewModel({
    @required this.questions,
    @required this.onLoadMore,
    @required this.onRefresh,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      questions: store.state.questions,
      onLoadMore: (int page) {
        LoadQuestionsAction action = LoadQuestionsAction.params(
            page: page,
            sortType: store.state.selectedSortType
        );
        store.dispatch(action);
        return action.completer.future;
      },
      onRefresh: () {
        LoadQuestionsAction action = LoadQuestionsAction.params(sortType: store.state.selectedSortType);
        store.dispatch(action);
        return action.completer.future;
      },
    );
  }
}