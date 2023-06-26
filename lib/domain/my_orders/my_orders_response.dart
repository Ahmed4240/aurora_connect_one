import 'dart:convert';

import '../confirm_order/confirm_order_response.dart';
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
  OrderDetail? orderDetail;

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
    orderDetail = OrderDetail.fromJson((json['orderDetail']));
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

class OrderDetail {
  String? slug;
  String? providerName;
  String? providerImage;
  String? planType;
  List<Network>? network;
  String? information;
  String? data1;
  num? price;
  num? discountPrice;
  num? discount;
  String? validity;
  String? id;
  String? title;
  List<CountryList>? countryList;

  OrderDetail({
    this.slug,
    this.providerName,
    this.providerImage,
    this.planType,
    this.network,
    this.information,
    this.data1,
    this.price,
    this.discountPrice,
    this.discount,
    this.validity,
    this.id,
    this.title,
    this.countryList,
  });

  OrderDetail.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    providerName = json['providerName'];
    providerImage = json['providerImage'];
    planType = json['planType'];
    if (json['network'] != null) {
      network = <Network>[];
      json['network'].forEach((v) {
        network!.add(Network.fromJson(v));
      });
    }
    information = json['information'];
    data1 = json['data'];
    price = json['price'];
    discountPrice = json['discountPrice'];
    discount = json['discount'];
    validity = json['validity'];
    id = json['id'];
    title = json['title'];
    if (json['countryList'] != null) {
      countryList = <CountryList>[];
      json['countryList'].forEach((v) {
        countryList!.add(CountryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['slug'] = slug;
    data['providerName'] = providerName;
    data['providerImage'] = providerImage;
    data['planType'] = planType;
    data['network'] = network;
    data['information'] = information;
    data['data'] = data1;
    data['price'] = price;
    data['discountPrice'] = discountPrice;
    data['discount'] = discount;
    data['validity'] = validity;
    data['id'] = id;
    data['title'] = title;
    data['countryList'] =countryList != null ? countryList!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}

class CountryList {
  String ?countryName;
  String ?countryImage;
  String ?countryCode;

  CountryList({
    this.countryName,
    this.countryImage,
    this.countryCode,
  });

  CountryList copyWith({
    String? countryName,
    String? countryImage,
    String? countryCode,
  }) =>
      CountryList(
        countryName: countryName ?? this.countryName,
        countryImage: countryImage ?? this.countryImage,
        countryCode: countryCode ?? this.countryCode,
      );

  factory CountryList.fromJson(Map<String, dynamic> json) => CountryList(
    countryName: json["countryName"],
    countryImage: json["countryImage"],
    countryCode: json["countryCode"],
  );

  Map<String, dynamic> toJson() => {
    "countryName": countryName,
    "countryImage": countryImage,
    "countryCode": countryCode,
  };
}