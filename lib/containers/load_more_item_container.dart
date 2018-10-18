import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_overflow/models/models.dart';
import 'package:flutter_overflow/selectors/selectors.dart';
import 'package:flutter_overflow/enums/load_more_item_status.dart';
import 'package:flutter_overflow/presentation/load_more_item.dart';

class LoadMoreItemContainer extends StatelessWidget {

  LoadMoreItemContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoadMoreItemStatus>(
      converter: (Store<AppState> store) => loadMoreStatusSelector(store.state),
      builder: (context, status) {
        return LoadMoreItem(status);
      },
    );
  }
}