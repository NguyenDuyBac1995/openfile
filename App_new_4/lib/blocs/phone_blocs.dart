
import 'package:app_new_2/blocs/blocs.dart';
import 'package:app_new_2/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/phone/phone_search_model.dart';

class PhoneBlocs {
  final _repository = Repository();
  final _fetcher = PublishSubject();
  Stream get phoneInfoModel => _fetcher.stream;

  getSearchPhoneDiscovery() async{
    PhoneSearchModel dataList = await _repository.getSearchPhoneDiscovery();
    _fetcher.sink.add(dataList);
  }
  dispose(){
    _fetcher.close();
  }
}

