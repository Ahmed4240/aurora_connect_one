
import 'dart:convert';
import 'package:aurora_connect_one/domain/error.dart';

CreateOrderResponse getCreateOrderResponse(String str) => CreateOrderResponse.fromJson(json.decode(str));
String getCreateOrderResponseString(CreateOrderResponse data) => json.encode(data.toJson());

class CreateOrderResponse {
  bool? isSuccess;
  CreateOrderData? data;
  dynamic error;

  CreateOrderResponse({
    this.isSuccess,
    this.data,
    this.error,
  });


  factory CreateOrderResponse.fromJson(Map<String, dynamic> json) => CreateOrderResponse(
    isSuccess: json["isSuccess"],
    data: CreateOrderData.fromJson(json["data"]),
    error: Error?.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "data": data,
    "error": error?.toJson(),
  };

}

class CreateOrderData {
  String? orderId;
  dynamic? simIccId;
  dynamic? userPackageList;

  CreateOrderData({
    this.orderId,
    this.simIccId,
    this.userPackageList,
  });

  CreateOrderData.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    simIccId = json['simIccId'];
    userPackageList = json['userPackageList'];
  }

}