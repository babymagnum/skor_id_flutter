import 'package:dio/dio.dart';
import 'package:skor_id_flutter/utils/helper/constant.dart';
import 'package:skor_id_flutter/model/standart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class BaseService {

  Future<Map<String, String>> getHeaders() async {
    var prefs = await SharedPreferences.getInstance();
    var maps = Map<String, String>();
    maps['Authorization'] = 'Bearer ${prefs.getString(Constant.TOKEN)}';
    return maps;
  }

  /// POST WITH FORM DATA
  Future<T> postFormData<T>(String url, FormData body) async {
    T resultResponse;

    try {
      final dio = Dio();
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
      var response = await dio.post(url, data: body, options: Options(headers: await getHeaders()));
      var responseMap = jsonDecode(response.toString());
      resultResponse = fromJson<T>(responseMap);
    } on DioError catch (e) {
      if (e.response!.statusCode == 302 && e.response.toString().contains('http://plis.id/plis_api/login')) {
        final preference = await SharedPreferences.getInstance();
        preference.clear();
      }
      var responseMap = jsonDecode(e.response.toString());
      resultResponse = fromJson<T>(responseMap);
    }

    return resultResponse;
  }

  /// POST
  Future<T> post<T>(String url) async {
    T resultResponse;

    try {
      final dio = Dio();
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
      var response = await dio.post(url, options: Options(headers: await getHeaders()));
      var responseMap = jsonDecode(response.toString());
      resultResponse = fromJson<T>(responseMap);
    } on DioError catch (e) {
      var responseMap = jsonDecode(e.response.toString());
      resultResponse = fromJson<T>(responseMap);
    }
    return resultResponse;
  }

  /// POST WITH JSON BODY
  Future<T> postJsonBody<T>(String url, dynamic body) async {
    T resultResponse;

    try {
      final dio = Dio();
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
      var response = await dio.post(url, data: body, options: Options(headers: await getHeaders()));
      var responseMap = jsonDecode(response.toString());
      resultResponse = fromJson<T>(responseMap);
    } on DioError catch (e) {
      var responseMap = jsonDecode(e.response.toString());
      resultResponse = fromJson<T>(responseMap);
    }

    return resultResponse;

  }

  /// GET
  Future<T> get<T>(String url) async {
    T resultResponse;

    try {
      final dio = Dio();
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
      var response = await dio.get(url, options: Options(headers: await getHeaders()));
      var responseMap = jsonDecode(response.toString());
      resultResponse = fromJson<T>(responseMap);
    } on DioError catch (e) {
      var responseMap = jsonDecode(e.response.toString());
      resultResponse = fromJson<T>(responseMap);
    }

    return resultResponse;
  }

  /// PUT JSON BODY
  Future<T> putJsonBody<T>(String url, dynamic body) async {
    T resultResponse;

    try {
      final dio = Dio();
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
      var response = await dio.put(url, data: body, options: Options(headers: await getHeaders()));
      var responseMap = jsonDecode(response.toString());
      resultResponse = fromJson<T>(responseMap);
    } on DioError catch (e) {
      var responseMap = jsonDecode(e.response.toString());
      resultResponse = fromJson<T>(responseMap);
    }

    return resultResponse;
  }

  /// DELETE
  Future<T> delete<T>(String url) async {
    T resultResponse;

    try {
      final dio = Dio();
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
      var response = await dio.delete(url, options: Options(headers: await getHeaders()));
      var responseMap = jsonDecode(response.toString());
      resultResponse = fromJson<T>(responseMap);
    } on DioError catch (e) {
      var responseMap = jsonDecode(e.response.toString());
      resultResponse = fromJson<T>(responseMap);
    }

    return resultResponse;
  }

  /// Converter json to dart object
  static T fromJson<T>(dynamic json) {
    if (json is Iterable) {
      return _fromJsonList<T>(json as List<dynamic>) as T;
    } else if (T == Standart) {
      return Standart.fromJson(json) as T;
    } else {
      // if this print statement occured, this means that you're not register the model class in here
      print('Unknown class, dont forget to add your model in BaseService.dart to parse the json');
      throw Exception('Unknown class');
    }
  }

  //from json list
  static List<T> _fromJsonList<T>(List? jsonList) {

    if (jsonList == null) {
      return <T>[];
    }

    List<T> output = [];

    for (Map<String, dynamic> json in jsonList as Iterable<Map<String, dynamic>>) {
      output.add(fromJson(json));
    }

    return output;
  }
}
