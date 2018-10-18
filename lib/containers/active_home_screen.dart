import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_overflow/models/models.dart';
import 'package:redux/redux.dart';
import 'package:flutter_overflow/constants.dart';
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
          body: SortedQuestions(),
        );
      },
    );
  }
}

class _ViewModel {
  final String title;

  _ViewModel({
    @required this.title,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      title: questionSortTypes[store.state.selectedSortType],
    );
  }
}