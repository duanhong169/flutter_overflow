import 'package:flutter/material.dart';
import 'package:flutter_overflow/helpers.dart';
import 'package:flutter_overflow/models/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_overflow/containers/load_more_item_container.dart';
import 'package:flutter_overflow/selectors/selectors.dart';
import 'package:flutter_overflow/enums/load_more_item_status.dart';

class ManagedListView extends StatelessWidget {

  final int itemCount;
  final IndexedWidgetBuilder builder;
  final LoadMoreCallback onLoadMore;

  final ScrollController _scrollController = new ScrollController();

  ManagedListView({this.itemCount, this.builder, this.onLoadMore});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      onInit: ((store) {
        _scrollController.addListener(() {
          if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
            LoadMoreItemStatus status = loadMoreStatusSelector(store.state);
            if (status == LoadMoreItemStatus.NORMAL || status == LoadMoreItemStatus.ERROR) {
              int page = store.state.questionsPage;
              onLoadMore(page + 1);
            }
          }
        });
      }),
      builder: (context, store) {
        return ListView.builder(
            controller: _scrollController,
            itemCount: itemCount + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index < itemCount) {
                return builder(context, index);
              } else {
                return LoadMoreItemContainer();
              }
            });
      },
    );
  }
}
