import 'package:flutter/material.dart';
import 'package:flutter_overflow/helpers.dart';

class ManagedListView extends StatefulWidget {

  final int itemCount;
  final IndexedWidgetBuilder builder;
  final LoadMoreCallback onLoadMore;

  ManagedListView({this.itemCount, this.builder, this.onLoadMore});

  @override
  _ManagedListViewState createState() => _ManagedListViewState(this.itemCount, this.builder, this.onLoadMore);
}

enum Status {
  NORMAL, LOADING, NO_MORE, ERROR, DISMISS
}

class _ManagedListViewState extends State<ManagedListView> {

  Status status = Status.NORMAL;

  int page = 1;
  final int itemCount;
  final IndexedWidgetBuilder builder;
  final LoadMoreCallback onLoadMore;

  final ScrollController _scrollController = new ScrollController();

  _ManagedListViewState(this.itemCount, this.builder, this.onLoadMore) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (status == Status.NORMAL || status == Status.ERROR) {
          setState(() {
            status = Status.LOADING;
          });
          Future<dynamic> result = onLoadMore(page + 1);
          result.whenComplete(() {
            result.then((succeed) {
              if (succeed) page++;
              setState(() {
                status = succeed ? Status.NORMAL : Status.ERROR;
              });
            });
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: itemCount + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index < itemCount) {
          return builder(context, index);
        } else {
          String text = "";
          switch (status) {
            case Status.NORMAL:
              text = "Pull up to load more";
              break;
            case Status.LOADING:
              text = "Loading…";
              break;
            case Status.NO_MORE:
              text = "No more content";
              break;
            case Status.ERROR:
              text = "Loading failed, click to retry";
              break;
            default:
              break;
          }

          return Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(text,
                style: TextStyle(color: Colors.black54),
            ),
          );
        }
      },
    );
  }
}