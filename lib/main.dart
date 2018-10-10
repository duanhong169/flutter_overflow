import 'package:flutter/material.dart';
import 'package:flutter_overflow/presentation/home_screen.dart';
import 'package:redux/redux.dart';
import 'package:flutter_overflow/models/models.dart';
import 'package:flutter_overflow/reducers/app_state_reducer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_overflow/actions/actions.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.loading(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Overflow',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: StoreBuilder<AppState>(
            onInit: (store) => store.dispatch(LoadQuestionsAction()),
            builder: (context, store) {
              HomeScreen(title: 'FlutterOverflow');
            }),
      ),
    );
  }
}
