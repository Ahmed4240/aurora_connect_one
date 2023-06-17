import 'dart:convert';

import 'package:aurora_connect_one/domain/plans/PlanDetail.dart';

GetPackagesGlobal getPackagesGlobalFromJson(String str) => GetPackagesGlobal.fromJson(json.decode(str));

String getPackagesGlobalToJson(GetPackagesGlobal data) => json.encode(data.toJson());

class GetPackagesGlobal {
  bool ?isSuccess;
  List<PlanDetail> ?data;
  dynamic error;

  GetPackagesGlobal({
    this.isSuccess,
    this.data,
    this.error,
  });

  factory GetPackagesGlobal.fromJson(Map<String, dynamic> json) => GetPackagesGlobal(
    isSuccess: json["isSuccess"],
    data: List<PlanDetail>.from(json["data"].map((x) => PlanDetail.fromJson(x))),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "error": error,
  };
}

enum Information { EMPTY, THIS_E_SIM_DOESN_T_COME_WITH_A_NUMBER, THIS_E_SIM_DOESN_T_COME_WITH_A_PHONE_NUMBER }

final informationValues = EnumValues({
  "": Information.EMPTY,
  "This eSIM doesn't come with a number.": Information.THIS_E_SIM_DOESN_T_COME_WITH_A_NUMBER,
  "This eSIM doesn't come with a phone number.": Information.THIS_E_SIM_DOESN_T_COME_WITH_A_PHONE_NUMBER
});

class Network {
  String ? name;
  Types ?types;

  Network({
    this.name,
    this.types,
  });

  factory Network.fromJson(Map<String, dynamic> json) => Network(
    name: json["name"],
    types: typesValues.map[json["types"]]!,
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "types": typesValues.reverse[types],
  };
}

enum Types { THE_5_G, LTE, THE_3_G, THE_4_G }

final typesValues = EnumValues({
  "LTE": Types.LTE,
  "3G": Types.THE_3_G,
  "4G": Types.THE_4_G,
  "5G": Types.THE_5_G
});

enum PlanType { DATA }

final planTypeValues = EnumValues({
  "data": PlanType.DATA
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}