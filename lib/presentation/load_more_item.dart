import 'package:flutter/material.dart';
import 'package:flutter_overflow/enums/load_more_item_status.dart';

class LoadMoreItem extends StatelessWidget {

  final LoadMoreItemStatus status;

  LoadMoreItem(this.status);

  @override
  Widget build(BuildContext context) {
    String text = "";
    switch (status) {
      case LoadMoreItemStatus.NORMAL:
        text = "Pull up to load more";
        break;
      case LoadMoreItemStatus.LOADING:
        text = "Loading…";
        break;
      case LoadMoreItemStatus.NO_MORE:
        text = "No more content";
        break;
      case LoadMoreItemStatus.ERROR:
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
}