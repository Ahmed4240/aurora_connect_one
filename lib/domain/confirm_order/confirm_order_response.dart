// To parse this JSON data, do
//
//     final confirmOrderResponse = confirmOrderResponseFromJson(jsonString);

import 'dart:convert';

ConfirmOrderResponse confirmOrderResponseFromJson(String str) => ConfirmOrderResponse.fromJson(json.decode(str));

String confirmOrderResponseToJson(ConfirmOrderResponse data) => json.encode(data.toJson());

class ConfirmOrderResponse {
  bool ?isSuccess;
  Data ?data;
  dynamic error;

  ConfirmOrderResponse({
    this.isSuccess,
    this.data,
    this.error,
  });

  ConfirmOrderResponse copyWith({
    bool? isSuccess,
    Data? data,
    dynamic error,
  }) =>
      ConfirmOrderResponse(
        isSuccess: isSuccess ?? this.isSuccess,
        data: data ?? this.data,
        error: error ?? this.error,
      );

  factory ConfirmOrderResponse.fromJson(Map<String, dynamic> json) => ConfirmOrderResponse(
    isSuccess: json["isSuccess"],
    data: Data.fromJson(json["data"]),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "data": data?.toJson(),
    "error": error,
  };
}

class Data {
  String ?orderId;
  dynamic ? simIccId;
  List<UserPackageList> ? userPackageList;

  Data({
    this.orderId,
    this.simIccId,
    this.userPackageList,
  });

  Data copyWith({
    String? orderId,
    dynamic simIccId,
    List<UserPackageList>? userPackageList,
  }) =>
      Data(
        orderId: orderId ?? this.orderId,
        simIccId: simIccId ?? this.simIccId,
        userPackageList: userPackageList ?? this.userPackageList,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    orderId: json["orderId"],
    simIccId: json["simIccId"],
    userPackageList: List<UserPackageList>.from(json["userPackageList"].map((x) => UserPackageList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "simIccId": simIccId,
    "userPackageList": List<dynamic>.from(userPackageList!.map((x) => x.toJson())),
  };
}

class UserPackageList {
  String ? slug;
  String ?providerName;
  String ?providerImage;
  String ?planType;
  List<Network>  ?network;
  String ?information;
  String ?data;
  double ?price;
  int ?discountPrice;
  int ?discount;
  String ?validity;
  String ?id;
  String ?title;
  List<CountryList> ?countryList;

  UserPackageList({
    this.slug,
    this.providerName,
    this.providerImage,
    this.planType,
    this.network,
    this.information,
    this.data,
    this.price,
    this.discountPrice,
    this.discount,
    this.validity,
    this.id,
    this.title,
    this.countryList,
  });

  UserPackageList copyWith({
    String? slug,
    String? providerName,
    String? providerImage,
    String? planType,
    List<Network>? network,
    String? information,
    String? data,
    double? price,
    int? discountPrice,
    int? discount,
    String? validity,
    String? id,
    String? title,
    List<CountryList>? countryList,
  }) =>
      UserPackageList(
        slug: slug ?? this.slug,
        providerName: providerName ?? this.providerName,
        providerImage: providerImage ?? this.providerImage,
        planType: planType ?? this.planType,
        network: network ?? this.network,
        information: information ?? this.information,
        data: data ?? this.data,
        price: price ?? this.price,
        discountPrice: discountPrice ?? this.discountPrice,
        discount: discount ?? this.discount,
        validity: validity ?? this.validity,
        id: id ?? this.id,
        title: title ?? this.title,
        countryList: countryList ?? this.countryList,
      );

  factory UserPackageList.fromJson(Map<String, dynamic> json) => UserPackageList(
    slug: json["slug"],
    providerName: json["providerName"],
    providerImage: json["providerImage"],
    planType: json["planType"],
    network: List<Network>.from(json["network"].map((x) => Network.fromJson(x))),
    information: json["information"],
    data: json["data"],
    price: json["price"].toDouble(),
    discountPrice: json["discountPrice"],
    discount: json["discount"],
    validity: json["validity"],
    id: json["id"],
    title: json["title"],
    countryList: List<CountryList>.from(json["countryList"].map((x) => CountryList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "slug": slug,
    "providerName": providerName,
    "providerImage": providerImage,
    "planType": planType,
    "network": List<dynamic>.from(network!.map((x) => x.toJson())),
    "information": information,
    "data": data,
    "price": price,
    "discountPrice": discountPrice,
    "discount": discount,
    "validity": validity,
    "id": id,
    "title": title,
    "countryList": List<dynamic>.from(countryList!.map((x) => x.toJson())),
  };
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

class Network {
  String ?name;
  String ?types;

  Network({
    this.name,
    this.types,
  });

  Network copyWith({
    String? name,
    String? types,
  }) =>
      Network(
        name: name ?? this.name,
        types: types ?? this.types,
      );

  factory Network.fromJson(Map<String, dynamic> json) => Network(
    name: json["name"],
    types: json["types"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "types": types,
  };
}