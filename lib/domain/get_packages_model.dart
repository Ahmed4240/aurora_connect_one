
import 'dart:convert';

GetPackages getPackagesFromJson(String str) => GetPackages.fromJson(json.decode(str));

String getPackagesToJson(GetPackages data) => json.encode(data.toJson());

class GetPackages {
  bool? isSuccess;
  List<Datum>? data;
  Error? error;

  GetPackages({
    this.isSuccess,
    this.data,
    this.error,
  });

  factory GetPackages.fromJson(Map<String, dynamic> json) => GetPackages(
    isSuccess: json["isSuccess"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    error: Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "data": List<dynamic>.from(data!.map((x) => x!.toJson())),
    "error": error?.toJson(),
  };
}

class Datum {
  String planType;
  List<Plan> plans;

  Datum({
    required this.planType,
    required this.plans,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    planType: json["planType"],
    plans: List<Plan>.from(json["plans"].map((x) => Plan.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "planType": planType,
    "plans": List<dynamic>.from(plans.map((x) => x.toJson())),
  };
}

class Plan {
  String countryName;
  String countryImage;
  String slug;
  int totalPlans;

  Plan({
    required this.countryName,
    required this.countryImage,
    required this.slug,
    required this.totalPlans,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    countryName: json["countryName"],
    countryImage: json["countryImage"],
    slug: json["slug"],
    totalPlans: json["totalPlans"],
  );

  Map<String, dynamic> toJson() => {
    "countryName": countryName,
    "countryImage": countryImage,
    "slug": slug,
    "totalPlans": totalPlans,
  };
}

class Error {
  int? code;
  String? message;

  Error({this.code, this.message,});

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    code: 1,                                                         //json["code"]
    message: 'sample message',                                       //json["message"]
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
  };
}