import 'dart:convert';

import '../plans/PlanDetail.dart';


ConfirmOrderResponse getConfirmOrderResponse(String str) => ConfirmOrderResponse.fromJson(json.decode(str));
String getConfirmOrderResponseString(ConfirmOrderResponse data) => json.encode(data.toJson());

class ConfirmOrderResponse {
  String? orderId;
  String? simIccId;
  String? userId;
  List<PlanDetail?>? userPackageList;

  ConfirmOrderResponse({
    this.orderId,
    this.simIccId,
    this.userId,
    this.userPackageList,
  });


  ConfirmOrderResponse.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    simIccId = json['simIccId'];
    userId = json['userId'];
    if (json['userPackageList'] != null) {
      userPackageList = <PlanDetail>[];
      json['userPackageList'].forEach((v) {
        userPackageList!.add(PlanDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderId'] = orderId;
    data['simIccId'] = simIccId;
    data['userId'] = userId;
    data['userPackageList'] =userPackageList != null ? userPackageList!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}
