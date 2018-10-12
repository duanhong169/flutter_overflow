import 'package:flutter/material.dart';
import 'package:flutter_overflow/models/models.dart';

class QuestionItem extends StatelessWidget {

  final Question question;
  final GestureTapCallback onTap;

  QuestionItem({this.question, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(question.title),
      subtitle: Text(question.score.toString()),
    );
  }
}