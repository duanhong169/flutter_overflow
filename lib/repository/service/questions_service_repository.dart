import 'dart:async';
import 'dart:core';

import 'package:meta/meta.dart';
import 'package:flutter_overflow/repository/stack_overflow_repository.dart';
import 'package:flutter_overflow/http/dio_http_client.dart';

class QuestionsServiceRepository implements QuestionsRepository {

  final DioHttpClient httpClient = DioHttpClient();

  @override
  Future<List<QuestionEntity>> fetchQuestions(Map params) {
    return httpClient.fetchQuestions(params);
  }

}