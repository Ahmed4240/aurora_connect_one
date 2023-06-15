import '../plans/PlanDetail.dart';

class CreateOrderRequest {
  int? quantity;
  String? packageId;
  String? userId;
  PlanDetail? planDetail;

  CreateOrderRequest({
    this.quantity,
    this.packageId,
    this.userId,
    this.planDetail,
  });


  CreateOrderRequest.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    packageId = json['packageId'];
    userId = json['userId'];
    planDetail = json['planDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quantity'] = quantity;
    data['packageId'] = packageId;
    data['userId'] = userId;
    data['planDetail'] = planDetail;
    return data;
  }
}

class CountryList {
  String countryName;
  String countryImage;
  String countryCode;

  CountryList({
    required this.countryName,
    required this.countryImage,
    required this.countryCode,
  });
}

class Network {
  String name;
  String types;

  Network({
    required this.name,
    required this.types,
  });
}
