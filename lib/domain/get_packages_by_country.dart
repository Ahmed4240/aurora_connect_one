

import 'dart:convert';
import 'dart:ffi';

GetPackagesByCountryModel getPackagesByCountryFromJson(String str) => GetPackagesByCountryModel.fromJson(json.decode(str));

String getPackagesByCountryToJson(GetPackagesByCountryModel data) => json.encode(data.toJson());

class CountryList {
  String? countryName;
  String? countryImage;
  String? countryCode;
  String? slug;
  int? totalPlans;

  CountryList({this.countryName, this.countryImage, this.countryCode, this.slug, this.totalPlans});

  CountryList.fromJson(Map<String, dynamic> json) {
    countryName = json['countryName'];
    countryImage = json['countryImage'];
    countryCode = json['countryCode'];
    slug = json['slug'];
    totalPlans = json['totalPlans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['countryName'] = countryName;
    data['countryImage'] = countryImage;
    data['countryCode'] = countryCode;
    data['slug'] = slug;
    data['totalPlans'] = totalPlans;
    return data;
  }
}

class NetworkList {
  String? name;
  String? types;

  NetworkList({this.name, this.types});

  NetworkList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    types = json['types'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['types'] = types;
    return data;
  }
}

class PlansDatum {
  String? slug;
  String? providerName;
  String? providerImage;
  String? planType;
  List<NetworkList?>? networkList;
  String? information;
  String? data;
  num? price;
  String? validity;
  String? id;
  String? title;
  List<CountryList?>? countryList;

  PlansDatum({this.slug, this.providerName, this.providerImage, this.data, this.price, this.validity, this.id, this.title, this.countryList});

  PlansDatum.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    providerName = json['providerName'];
    providerImage = json['providerImage'];
    planType = json['planType'];
    if (json['network'] != null) {
      networkList = <NetworkList>[];
      json['network'].forEach((v) {
        networkList!.add(NetworkList.fromJson(v));
      });
    }
    // network = json['network'];
    information = json['information'];
    data = json['data'];
    price = json['price'];
    validity = json['validity'];
    id = json['id'];
    title = json['title'];
    if (json['countryList'] != null) {
      countryList = <CountryList>[];
      json['countryList'].forEach((v) {
        countryList!.add(CountryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['slug'] = slug;
    data['providerName'] = providerName;
    data['providerImage'] = providerImage;
    data['planType'] = planType;
    data['network'] = networkList;
    data['information'] = information;
    data['data'] = data;
    data['price'] = price;
    data['validity'] = validity;
    data['id'] = id;
    data['title'] = title;
    data['countryList'] =countryList != null ? countryList!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}

class Error {
  int? code;
  String? message;

  Error({this.code, this.message});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class GetPackagesByCountryModel {
  bool? isSuccess;
  List<PlansDatum>? data;
  Error? error;

  GetPackagesByCountryModel({this.isSuccess, this.data, this.error});

  GetPackagesByCountryModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    if (json['data'] != null) {
      data = <PlansDatum>[];
      json['data'].forEach((v) {
        data!.add(PlansDatum.fromJson(v));
      });
    }
    error = json['error'] != null ? Error?.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "data": List<dynamic>.from(data!.map((x) => x!.toJson())),
    "error": error?.toJson(),
  };
}
