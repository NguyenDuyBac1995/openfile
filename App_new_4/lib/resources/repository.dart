import 'package:app_new_2/services/phone/phone_services.dart';
import '../models/phone/phone_search_model.dart';

class Repository{
  final phoneService = PhoneServices();

  Future<PhoneSearchModel> getSearchPhoneDiscovery() => phoneService.getSearchPhone();
}