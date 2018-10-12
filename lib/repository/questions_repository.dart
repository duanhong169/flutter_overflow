import 'dart:async';
import 'dart:core';
import 'package:flutter_overflow/repository/entity/question_entity.dart';

abstract class QuestionsRepository {

  Future<List<QuestionEntity>> fetchQuestions(Map<String, dynamic> params);
}