 import 'dart:convert';

import 'package:app_new_2/api/base/base_services.dart';
import 'package:app_new_2/api/config/api.dart';
import 'package:dio/dio.dart';

import '../../models/phone/phone_report_model.dart';
import '../../models/phone/phone_search_model.dart';

class PhoneServices extends BaseServices {
  Future<PhoneReportModel> getFivePhoneReport() async {
    var resp = await request(
        Api.instance.getPhoneReport
            .replaceAll("%page%", "1")
            .replaceAll("%limit%", "20"),
        RequestType.GET,
        useToken: false);
    PhoneReportModel result = PhoneReportModel.fromJson(resp);

    return result;
  }

  Future<PhoneSearchModel> getSearchPhoneDiscovery(int page) async {
    var resp = await request(
        Api.instance.getPhoneSearch.replaceAll("%page%", page.toString()),
        RequestType.GET,
        useToken: false);
    PhoneSearchModel result = PhoneSearchModel.fromJson(resp);
    return result;
  }

}