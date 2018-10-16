import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_overflow/models/models.dart';
import 'package:redux/redux.dart';
import 'package:flutter_overflow/constants.dart';
import 'package:flutter_overflow/actions/actions.dart';
import 'sort_types.dart';
import 'sorted_questions.dart';

class ActiveHomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return Scaffold(
          appBar: AppBar(
              title: Text(vm.title)
          ),
          drawer: Drawer(
            child: SortTypes(),
          ),
          body: RefreshIndicator(
            child: SortedQuestions(),
            onRefresh: vm.onRefresh,
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final String title;
  final Function() onRefresh;

  _ViewModel({
    @required this.title,
    @required this.onRefresh,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      title: questionSortTypes[store.state.selectedSortType],
      onRefresh: () {
        LoadQuestionsAction action = LoadQuestionsAction.params(sortType: store.state.selectedSortType);
        store.dispatch(action);
        return action.completer.future;
      },
    );
  }
}