import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_overflow/actions/actions.dart';
import 'package:flutter_overflow/models/models.dart';
import 'package:flutter_overflow/constants.dart';

class SortTypes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return Container(
          child: ListView(
            padding: EdgeInsets.zero,
            children: drawerItems(context, vm),
          ),
        );
      },
    );
  }

  List<Widget> drawerItems(BuildContext context, _ViewModel vm) {
    List<Widget> widgets = List<Widget>();
    widgets.add(Container(
        height: 88.0,
        child: DrawerHeader(
          child: Text('Choose a sort type',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        )
    ));
    widgets.addAll(questionSortTypes.keys.map((key) {
      return ListTile(
        title: Text(questionSortTypes[key]),
        onTap: () {
          Navigator.pop(context);
          vm.onSortTypeSelected(key);
        },
      );
    }).toList());
    return widgets;
  }
}

class _ViewModel {
  final String selectedSortType;
  final Function(String) onSortTypeSelected;

  _ViewModel({
    @required this.selectedSortType,
    @required this.onSortTypeSelected,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      selectedSortType: store.state.selectedSortType,
      onSortTypeSelected: (key) {
        store.dispatch(SelectSortTypeAction(key));
        store.dispatch(LoadQuestionsAction.params(
            page: 1,
            sortType: store.state.selectedSortType
        ));
      },
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is _ViewModel &&
              runtimeType == other.runtimeType &&
              selectedSortType == other.selectedSortType;

  @override
  int get hashCode => selectedSortType.hashCode;

}