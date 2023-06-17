// To parse this JSON data, do
//
//     final getPackagesModel = getPackagesModelFromJson(jsonString);

import 'dart:convert';

GetPackagesModel getPackagesModelFromJson(String str) => GetPackagesModel.fromJson(json.decode(str));

String getPackagesModelToJson(GetPackagesModel data) => json.encode(data.toJson());

class GetPackagesModel {
  bool? isSuccess;
  List<Datum>? data;
  dynamic error;

  GetPackagesModel({
    this.isSuccess,
    this.data,
    this.error,
  });

  factory GetPackagesModel.fromJson(Map<String, dynamic> json) => GetPackagesModel(
    isSuccess: json["isSuccess"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "error": error,
  };
}

class Datum {
  String? planType;
  List<Plan>? plans;

  Datum({
    this.planType,
    this.plans,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    planType: json["planType"],
    plans: List<Plan>.from(json["plans"].map((x) => Plan.fromJson(x))) ,
  );

  Map<String, dynamic> toJson() => {
    "planType": planType,
    "plans": List<dynamic>.from(plans!.map((x) => x.toJson())),
  };
}

class Plan {
  String? countryName;
  String? countryImage;
  String? countryCode;
  String? slug;
  int? totalPlans;

  Plan({
    this.countryName,
    this.countryImage,
    this.countryCode,
    this.slug,
    this.totalPlans,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    countryName: json["countryName"] ?? "",
    countryImage: json["countryImage"] ?? "",
    countryCode: json["countryCode"] ?? "",
    slug: json["slug"] ?? "",
    totalPlans: json["totalPlans"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "countryName": countryName,
    "countryImage": countryImage,
    "countryCode": countryCode,
    "slug": slug,
    "totalPlans": totalPlans,
  };
}