// To parse this JSON data, do
//
//     final createOrderResponse = createOrderResponseFromJson(jsonString);

import 'dart:convert';

CreateOrderResponse createOrderResponseFromJson(String str) => CreateOrderResponse.fromJson(json.decode(str));

String createOrderResponseToJson(CreateOrderResponse data) => json.encode(data.toJson());

class CreateOrderResponse {
  bool ? isSuccess;
  Data ?data;
  dynamic error;

  CreateOrderResponse({
    this.isSuccess,
    this.data,
    this.error,
  });

  CreateOrderResponse copyWith({
    bool? isSuccess,
    Data? data,
    dynamic error,
  }) =>
      CreateOrderResponse(
        isSuccess: isSuccess ?? this.isSuccess,
        data: data ?? this.data,
        error: error ?? this.error,
      );

  factory CreateOrderResponse.fromJson(Map<String, dynamic> json) => CreateOrderResponse(
    isSuccess: json["isSuccess"],
    data: Data.fromJson(json["data"]),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "data": data!.toJson(),
    "error": error,
  };
}

class Data {
  String ?orderId;
  dynamic simIccId;
  dynamic userPackageList;

  Data({
    this.orderId,
    this.simIccId,
    this.userPackageList,
  });

  Data copyWith({
    String? orderId,
    dynamic simIccId,
    dynamic userPackageList,
  }) =>
      Data(
        orderId: orderId ?? this.orderId,
        simIccId: simIccId ?? this.simIccId,
        userPackageList: userPackageList ?? this.userPackageList,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    orderId: json["orderId"],
    simIccId: json["simIccId"],
    userPackageList: json["userPackageList"],
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "simIccId": simIccId,
    "userPackageList": userPackageList,
  };
}
