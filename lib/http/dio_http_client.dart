import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';
import 'package:flutter_overflow/repository/stack_overflow_repository.dart';

class DioHttpClient {
  static final DioHttpClient _httpClient = DioHttpClient._internal();
  Dio _dio = Dio();

  factory DioHttpClient() {
    return _httpClient;
  }

  DioHttpClient._internal() {
    _dio.options.baseUrl = "https://api.stackexchange.com/2.2/";
    _dio.interceptor.request.onSend = (Options options) {
      if (options.method == null || options.method == "GET") {
        if (options.data is Map) {
          Map data = options.data;
          data["key"] = "bOoOtcwFjFbprZWiuNc69g((";
          data.putIfAbsent("site", () => "stackoverflow");
          data.putIfAbsent("filter", () => "default");
        }
      }
      return options;
    };
  }

  Future<List<QuestionEntity>> fetchQuestions(Map<String, dynamic> params) async {
    try {
      Response<Map<String, dynamic>> response = await _dio.get("questions", data: params);
      return QuestionsListEntity.fromJson(response.data).questions;
    } on DioError catch(e) {
      if(e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        print(e.message);
      }
      rethrow;
    }
  }
}