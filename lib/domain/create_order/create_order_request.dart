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
