import 'package:flutter/material.dart';
import 'package:flutter_overflow/containers/sort_types.dart';

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
    );
  }
}
