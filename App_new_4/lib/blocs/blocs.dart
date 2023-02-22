import 'package:app_new_2/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

import '../models/model.dart';


abstract class BaseBloc<T extends BaseModel >{
  final repository = Repository();

  final fetcher = PublishSubject<T>();

  dispose(){
    fetcher.close();
  }
}