import 'package:flutter/material.dart';
import 'package:flutter_overflow/presentation/home_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Overflow',
      theme: new ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: new HomeScreen(title: 'FlutterOverflow'),
    );
  }
}
