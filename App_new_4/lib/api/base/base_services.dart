
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';


enum RequestType { GET, POST, DELETE, PUT }

class BaseServices {
  final Dio _dio = Dio();
  Options? _headersOption;


  Future<dynamic> request(String url, RequestType type,
      {dynamic data,
        bool? useToken,
        bool? useProfileId,
        bool? usePrimaryId}) async {
    var response;
    Logger().d(url);
    try {
      switch (type) {
        case RequestType.POST:
          response = await _dio.post(url, data: data, options: _headersOption);
          break;
        case RequestType.GET:
          response = await _dio.get(url, options: _headersOption);
          break;
        case RequestType.DELETE:
          response =
          await _dio.delete(url, data: data, options: _headersOption);
          break;
        case RequestType.PUT:
          response = await _dio.put(url, data: data, options: _headersOption);
          break;
      }
    } on DioError catch (e) {
      Logger().e(e.toString());
      response = e.response;
    }
    //* handling error and status code
    var resData;
    try {
      resData = json.decode(response.data);
    } catch (e) {
      // Logger().e(e.toString());
      resData = response.data;
    }

    return resData;
  }
}
