import 'dart:convert';

import '../plans/PlanDetail.dart';
import '../error.dart';

MyOrdersResponse getMyOrdersFromJson(String str) => MyOrdersResponse.fromJson(json.decode(str));
String getMyOrdersToJson(MyOrdersResponse data) => json.encode(data.toJson());


class MyOrdersResponse {
  bool? isSuccess;
  List<MyOrdersDataResponse>? data;
  Error? error;

  MyOrdersResponse({
    this.isSuccess,
    this.data,
    this.error,
  });

  MyOrdersResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    if (json['data'] != null) {
      data = <MyOrdersDataResponse>[];
      json['data'].forEach((v) {
        data!.add(MyOrdersDataResponse.fromJson(v));
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

class MyOrdersDataResponse {
  num? orderId;
  String? providerName;
  String? orderDate;
  String? data;
  String? price;
  String? paymentMethod;
  num? discount;
  PlanDetail? orderDetail;

  MyOrdersDataResponse({
    this.orderId,
    this.providerName,
    this.orderDate,
    this.data,
    this.price,
    this.paymentMethod,
    this.discount,
    this.orderDetail,
  });

  MyOrdersDataResponse.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    providerName = json['providerName'];
    orderDate = json['orderDate'];
    data = json['data'];
    price = json['price'];
    paymentMethod = json['paymentMethod'];
    discount = json['discount'];
    orderDetail = json['orderDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderId'] = orderId;
    data['providerName'] = providerName;
    data['orderDate'] = orderDate;
    data['data'] = data;
    data['price'] = price;
    data['paymentMethod'] = paymentMethod;
    data['discount'] = discount;
    data['orderDetail'] = orderDetail;
    return data;
  }
}
