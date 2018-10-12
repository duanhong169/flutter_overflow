import 'package:flutter/material.dart';
import 'package:flutter_overflow/containers/sort_types.dart';
import 'package:flutter_overflow/containers/sorted_questions.dart';

class HomeScreen extends StatelessWidget {

  final String title;

  HomeScreen({@required this.title}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title)
      ),
      drawer: Drawer(
        child: SortTypes(),
      ),
      body: SortedQuestions(),
    );
  }
}
