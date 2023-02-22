 import 'dart:convert';

import 'package:app_new_2/api/config/api.dart';
import 'package:dio/dio.dart';

import '../../models/phone/phone_search_model.dart';

class PhoneServices {
  final Dio _dio = Dio();

  Future<PhoneSearchModel> getSearchPhone() async {
    Response resp = await _dio.get(Api.instance.getPhoneSearch);

    if(resp.statusCode == 200){
      PhoneSearchModel result = PhoneSearchModel.fromJson(json.decode(resp.data));
      return result;
    }else{
      throw Exception('Lỗi khi load Json');
    }
  }
}