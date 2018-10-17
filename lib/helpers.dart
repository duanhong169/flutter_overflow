import 'package:dio/dio.dart';

String printForDioOptions(Options options) {
  return "@: ${options.baseUrl}${options.path}, params: ${options.data.toString()}";
}

typedef LoadMoreCallback = Future<dynamic> Function(int page);
