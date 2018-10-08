import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  final String title;

  HomeScreen({@required this.title}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title)
      ),
    );
  }
}