import 'dart:convert';
import '../error.dart';
import 'package:aurora_connect_one/domain/plans/PlanDetail.dart';

PlansInCountryResponse getPlansInCountryResponseFromJson(String str) => PlansInCountryResponse.fromJson(json.decode(str));

String getPlansInCountryResponseToJson(PlansInCountryResponse data) => json.encode(data.toJson());

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

class PlansInCountryResponse {
  bool? isSuccess;
  List<PlanDetail>? data;
  Error? error;

  PlansInCountryResponse({this.isSuccess, this.data, this.error});

  PlansInCountryResponse.fromJson(Map<String, dynamic> json) {
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
