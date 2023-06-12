

import 'dart:convert';

GetPackagesByGlobal getPackagesByGlobalFromJson(String str) => GetPackagesByGlobal.fromJson(json.decode(str));

String getPackagesByGlobalToJson(GetPackagesByGlobal data) => json.encode(data.toJson());

class GetPackagesByGlobal {
  bool? isSuccess;
  List<GlobalDatum>? data;
  Error? error;

  GetPackagesByGlobal({
    this.isSuccess,
    this.data,
    this.error,
  });

  factory GetPackagesByGlobal.fromJson(Map<String, dynamic> json) => GetPackagesByGlobal(
    isSuccess: json["isSuccess"],
    data: List<GlobalDatum>.from(json["data"].map((x) => GlobalDatum.fromJson(x))),
    error: Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "data": List<dynamic>.from(data!.map((x) => x!.toJson())),
    "error": error?.toJson(),
  };
}

class GlobalDatum {
  String providerName;
  String providerImage;
  String data;
  int price;
  String validity;
  String id;
  String title;
  List<CountryList> countryList;

  GlobalDatum({
    required this.providerName,
    required this.providerImage,
    required this.data,
    required this.price,
    required this.validity,
    required this.id,
    required this.title,
    required this.countryList,
  });

  factory GlobalDatum.fromJson(Map<String, dynamic> json) => GlobalDatum(
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

class Error {
  int code;
  String message;

  Error({
    required this.code,
    required this.message,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    code: 1,
    message: 'message',
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
  };
}