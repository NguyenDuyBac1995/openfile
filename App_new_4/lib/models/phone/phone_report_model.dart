import 'package:app_new_2/models/model.dart';

class PhoneReportModel extends BaseModel {
  List<Data>? data;
  bool? hasNextPage;

  PhoneReportModel({ this.data, this.hasNextPage});

  PhoneReportModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    hasNextPage = json['hasNextPage: '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['hasNextPage: '] = this.hasNextPage;
    return data;
  }
}

class Data {
  int? id;
  String? phoneNumber;
  Object? phoneDesription;
  Null originImage;
  Null backerBy;
  Null phoneLongDesription;
  Null supplier;
  Null websiteUrl;
  Null taxCode;
  Null address;
  Null hasNextPageSearch;
  Null hasNextPageAccess;
  Null nameBusiness;
  Null industry;
  Null contactInformation;
  Null isDeleted;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? sEntity;

  Data(
      {this.id,
        this.phoneNumber,
        this.phoneDesription,
        this.originImage,
        this.backerBy,
        this.phoneLongDesription,
        this.supplier,
        this.websiteUrl,
        this.taxCode,
        this.address,
        this.hasNextPageSearch,
        this.hasNextPageAccess,
        this.nameBusiness,
        this.industry,
        this.contactInformation,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.sEntity});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phoneNumber'];
    phoneDesription = json['phoneDesription'];
    originImage = json['originImage'];
    backerBy = json['backerBy'];
    phoneLongDesription = json['phoneLongDesription'];
    supplier = json['supplier'];
    websiteUrl = json['websiteUrl'];
    taxCode = json['taxCode'];
    address = json['address'];
    hasNextPageSearch = json['hasNextPageSearch'];
    hasNextPageAccess = json['hasNextPageAccess'];
    nameBusiness = json['nameBusiness'];
    industry = json['industry'];
    contactInformation = json['contactInformation'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    sEntity = json['__entity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phoneNumber'] = this.phoneNumber;
    data['phoneDesription'] = this.phoneDesription;
    data['originImage'] = this.originImage;
    data['backerBy'] = this.backerBy;
    data['phoneLongDesription'] = this.phoneLongDesription;
    data['supplier'] = this.supplier;
    data['websiteUrl'] = this.websiteUrl;
    data['taxCode'] = this.taxCode;
    data['address'] = this.address;
    data['hasNextPageSearch'] = this.hasNextPageSearch;
    data['hasNextPageAccess'] = this.hasNextPageAccess;
    data['nameBusiness'] = this.nameBusiness;
    data['industry'] = this.industry;
    data['contactInformation'] = this.contactInformation;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['__entity'] = this.sEntity;
    return data;
  }
}
