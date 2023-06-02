import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/data/raw_data.dart';

const baseUrl = 'https://raw.githubusercontent.com/bachbnt/demos/main/';
const questionPath = 'questionList.json';
const hasApi = true;

class ApiClient {
  late Dio _dio;
  ApiClient() {
    init();
  }

  static ApiClient? instance;

  static ApiClient getInstance() {
    instance ??= ApiClient();
    return instance!;
  }

  List<Question> _questionsList = [];

  void init() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: onRequest, onResponse: onResponse, onError: onError));
  }

  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return handler.next(options);
  }

  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  void onError(DioError error, ErrorInterceptorHandler handler) {
    return handler.next(error);
  }

  Future<T> get<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    Response response = await _dio.get<T>(path,
        data: data, queryParameters: queryParameters, options: options);
    return response.data;
  }

  Future<List<Question>> getRemoteQuestions() async {
    String raw = await get(questionPath);
    List<dynamic> _json = json.decode(raw);
    List<Question> data = _json.map((json) => Question.fromJson(json)).toList();
    _questionsList = data;
    return data;
  }

  List<Question> getLocalQuestions() {
    return hasApi ? _questionsList : questionList;
  }
}
