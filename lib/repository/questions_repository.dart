import 'dart:async';
import 'dart:core';
import 'question_entity.dart';

abstract class QuestionsRepository {

  Future<List<QuestionEntity>> fetchQuestions(Map params);
}