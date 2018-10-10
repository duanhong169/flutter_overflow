import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_overflow/models/models.dart';
import 'package:flutter_overflow/presentation/question_list.dart';
import 'package:redux/redux.dart';

class SortedQuestions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return QuestionList(
        );
      },
    );
  }
}

class _ViewModel {
  final List<Question> questions;
  final bool isLoading;

  _ViewModel({
    @required this.questions,
    @required this.isLoading,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      // TODO
      questions: null,
      isLoading: store.state.isLoading,
    );
  }
}