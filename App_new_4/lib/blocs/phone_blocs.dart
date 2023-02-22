

import '../models/phone/phone_search_model.dart';
import 'blocs.dart';

class PhoneBlocs extends BaseBloc<PhoneSearchModel> {
  Stream<PhoneSearchModel> get phoneInfoModel => fetcher.stream;

  PhoneSearchModel? _phoneSearchModel;

  PhoneSearchModel? get phoneSearchModel => _phoneSearchModel;

  getPhoneSearchDiscovery(int page) async {
    if (page == 1) {
      _phoneSearchModel = null;
      _phoneSearchModel = await repository.getSearchPhoneDiscovery(page);

      fetcher.sink.add(_phoneSearchModel!);
    } else {
      PhoneSearchModel dataList =
      await repository.getSearchPhoneDiscovery(page);

      _phoneSearchModel?.data?.addAll(dataList.data ?? []);
      fetcher.sink.add(_phoneSearchModel!);
    }
  }
}

final phoneBlocs = PhoneBlocs();