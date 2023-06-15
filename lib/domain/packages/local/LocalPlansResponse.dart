
import 'dart:convert';
import '../../error.dart';

LocalPackagesResponse getLocalPackagesResponseFromJson(String str) => LocalPackagesResponse.fromJson(json.decode(str));

String getPackagesToJson(LocalPackagesResponse data) => json.encode(data.toJson());

class LocalPackagesResponse {
  bool? isSuccess;
  List<LocalPackagesResponseData>? data;
  Error? error;

  LocalPackagesResponse({
    this.isSuccess,
    this.data,
    this.error,
  });

  factory LocalPackagesResponse.fromJson(Map<String, dynamic> json) => LocalPackagesResponse(
    isSuccess: json["isSuccess"],
    data: List<LocalPackagesResponseData>.from(json["data"].map((x) => LocalPackagesResponseData.fromJson(x))),
    error: Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "data": List<dynamic>.from(data!.map((x) => x!.toJson())),
    "error": error?.toJson(),
  };
}

class LocalPackagesResponseData {
  String planType;
  List<LocalPlan> plans;

  LocalPackagesResponseData({
    required this.planType,
    required this.plans,
  });

  factory LocalPackagesResponseData.fromJson(Map<String, dynamic> json) => LocalPackagesResponseData(
    planType: json["planType"],
    plans: List<LocalPlan>.from(json["plans"].map((x) => LocalPlan.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "planType": planType,
    "plans": List<dynamic>.from(plans.map((x) => x.toJson())),
  };
}

class LocalPlan {
  String countryName;
  String countryImage;
  String slug;
  int totalPlans;

  LocalPlan({
    required this.countryName,
    required this.countryImage,
    required this.slug,
    required this.totalPlans,
  });

  factory LocalPlan.fromJson(Map<String, dynamic> json) => LocalPlan(
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