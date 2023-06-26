
class PlanDetail {
  String? slug;
  String? providerName;
  String? providerImage;
  String? planType;
  List<NetworkList?>? networkList;
  String? information;
  String? data1;
  num? price;
  num? discountPrice;
  num? discount;
  String? validity;
  String? id;
  String? title;
  List<CountryList>? countryList;

  PlanDetail({
    required this.slug,
    required this.providerName,
    required this.providerImage,
    required this.planType,
    required this.networkList,
    required this.information,
    required this.data1,
    required this.price,
    required this.discountPrice,
    required this.validity,
    required this.id,
    required this.title,
    required this.countryList,
  });

  PlanDetail.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    providerName = json['providerName'];
    providerImage = json['providerImage'];
    planType = json['planType'];
    if (json['network'] != null) {
      networkList = <NetworkList>[];
      json['network'].forEach((v) {
        networkList!.add(NetworkList.fromJson(v));
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
    data['network'] = networkList;
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

class NetworkList {
  String? name;
  String? types;

  NetworkList({this.name, this.types});

  NetworkList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    types = json['types'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['types'] = types;
    return data;
  }
}

class CountryList {
  String? countryName;
  String? countryImage;
  String? countryCode;

  CountryList({this.countryName, this.countryImage, this.countryCode});

  CountryList.fromJson(Map<String, dynamic> json) {
    countryName = json['countryName'];
    countryImage = json['countryImage'];
    countryCode = json['countryCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['countryName'] = countryName;
    data['countryImage'] = countryImage;
    data['countryCode'] = countryCode;
    return data;
  }
}