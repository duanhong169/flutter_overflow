import 'package:flutter/material.dart';
import 'package:flutter_overflow/containers/active_home_screen.dart';
import 'package:redux/redux.dart';
import 'package:logging/logging.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:flutter_overflow/models/models.dart';
import 'package:flutter_overflow/reducers/app_state_reducer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_overflow/actions/actions.dart';
import 'package:flutter_overflow/middleware/store_stack_overflow_middleware.dart';

void main() => runApp(new MyApp());

final logger = new Logger("Redux Logger");
final loggerMiddleware = LoggingMiddleware<AppState>.printer(logger: logger);

class MyApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.loadingQuestions(),
    middleware: createStoreStackOverflowMiddleware()..add(loggerMiddleware),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Overflow',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StoreBuilder<AppState>(
            onInit: (store) => store.dispatch(
                LoadQuestionsAction.params(
                    page: 1,
                    sortType: store.state.selectedSortType
                )
            ),
            builder: (context, store) {
              return ActiveHomeScreen();
            }),
      ),
    );
  }
}
