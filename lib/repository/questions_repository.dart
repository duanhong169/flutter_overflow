import 'dart:async';
import 'dart:core';
import 'package:flutter_overflow/models/models.dart';

abstract class QuestionsRepository {

  Future<List<Question>> loadQuestions();
}