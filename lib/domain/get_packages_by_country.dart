

import 'dart:convert';
import 'dart:ffi';

import 'package:aurora_connect_one/domain/plans/PlanDetail.dart';

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
  List<PlanDetail>? data;
  Error? error;

  GetPackagesByCountryModel({this.isSuccess, this.data, this.error});

  GetPackagesByCountryModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    if (json['data'] != null) {
      data = <PlanDetail>[];
      json['data'].forEach((v) {
        data!.add(PlanDetail.fromJson(v));
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
