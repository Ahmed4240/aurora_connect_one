

import 'dart:convert';
import '../../error.dart';

GlobalPackagesResponse getGlobalPackagesResponseFromJson(String str) => GlobalPackagesResponse.fromJson(json.decode(str));

String getGlobalPackagesResponseToJson(GlobalPackagesResponse data) => json.encode(data.toJson());

class GlobalPackagesResponse {
  bool? isSuccess;
  List<GlobalPackagesData>? data;
  Error? error;

  GlobalPackagesResponse({
    this.isSuccess,
    this.data,
    this.error,
  });

  factory GlobalPackagesResponse.fromJson(Map<String, dynamic> json) => GlobalPackagesResponse(
    isSuccess: json["isSuccess"],
    data: List<GlobalPackagesData>.from(json["data"].map((x) => GlobalPackagesData.fromJson(x))),
    error: Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "data": List<dynamic>.from(data!.map((x) => x!.toJson())),
    "error": error?.toJson(),
  };
}

class GlobalPackagesData {
  String providerName;
  String providerImage;
  String data;
  int price;
  String validity;
  String id;
  String title;
  List<CountryList> countryList;

  GlobalPackagesData({
    required this.providerName,
    required this.providerImage,
    required this.data,
    required this.price,
    required this.validity,
    required this.id,
    required this.title,
    required this.countryList,
  });

  factory GlobalPackagesData.fromJson(Map<String, dynamic> json) => GlobalPackagesData(
    providerName: json["providerName"],
    providerImage: json["providerImage"],
    data: json["data"],
    price: json["price"],
    validity: json["validity"],
    id: json["id"],
    title: json["title"],
    countryList: List<CountryList>.from(json["countryList"].map((x) => CountryList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "providerName": providerName,
    "providerImage": providerImage,
    "data": data,
    "price": price,
    "validity": validity,
    "id": id,
    "title": title,
    "countryList": List<dynamic>.from(countryList.map((x) => x.toJson())),
  };
}

class CountryList {
  String countryName;
  String countryImage;
  String countryCode;
  String? slug;
  int totalPlans;

  CountryList({
    required this.countryName,
    required this.countryImage,
    required this.countryCode,
    this.slug,
    required this.totalPlans,
  });

  factory CountryList.fromJson(Map<String, dynamic> json) => CountryList(
    countryName: json["countryName"],
    countryImage: json["countryImage"],
    countryCode: json["countryCode"],
    slug: json["slug"],
    totalPlans: json["totalPlans"],
  );

  Map<String, dynamic> toJson() => {
    "countryName": countryName,
    "countryImage": countryImage,
    "countryCode": countryCode,
    "slug": "slug",
    "totalPlans": totalPlans,
  };
}