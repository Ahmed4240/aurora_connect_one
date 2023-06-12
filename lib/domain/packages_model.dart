
class PackagesModel {
  List<Packages>? packages;

  PackagesModel({this.packages});

  PackagesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      packages = <Packages>[];
      json['data'].forEach((v) { packages!.add(Packages.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    if (packages != null) {
      data['data'] = packages!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Packages {
  String? packageType;
  List<PackageDetail>? packageDetail;
  int? totalPlans;

  Packages({this.packageType, this.packageDetail, this.totalPlans});

  Packages.fromJson(Map<String, dynamic> json) {
    packageType = json['packageType'];
    if (json['packageDetail'] != null) {
      packageDetail = <PackageDetail>[];
      json['packageDetail'].forEach((v) {
        packageDetail!.add(PackageDetail.fromJson(v));
      });
    }
    totalPlans = json['totalPlans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['packageType'] = packageType;
    if (packageDetail != null) {
      data['packageDetail'] =
          packageDetail!.map((v) => v.toJson()).toList();
    }
    data['totalPlans'] = totalPlans;
    return data;
  }
}

class PackageDetail {
  String? id;
  int? operatorId;
  String? operatorName;
  String? operatorImage;
  String? countryName;
  String? countryImage;
  String? countryCode;
  List<Plans>? plans;
  List<Country>? country;

  PackageDetail(
      {this.id,
        this.operatorId,
        this.operatorName,
        this.operatorImage,
        this.countryName,
        this.countryImage,
        this.countryCode,
        this.plans,
        this.country});

  PackageDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    operatorId = json['operatorId'];
    operatorName = json['operatorName'];
    operatorImage = json['operatorImage'];
    countryName = json['countryName'];
    countryImage = json['countryImage'];
    countryCode = json['countryCode'];
    if (json['plans'] != null) {
      plans = <Plans>[];
      json['plans'].forEach((v) {
        plans!.add(Plans.fromJson(v));
      });
    }
    if (json['country'] != null) {
      country = <Country>[];
      json['country'].forEach((v) {
        country!.add(Country.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['operatorId'] = operatorId;
    data['operatorName'] = operatorName;
    data['operatorImage'] = operatorImage;
    data['countryName'] = countryName;
    data['countryImage'] = countryImage;
    data['countryCode'] = countryCode;
    if (plans != null) {
      data['plans'] = plans!.map((v) => v.toJson()).toList();
    }
    if (country != null) {
      data['country'] = country!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Plans {
  String? id;
  String? title;
  String? validity;
  String? data;
  int? price;

  Plans({this.id, this.title, this.validity, this.data, this.price});

  Plans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    validity = json['validity'];
    data = json['data'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['validity'] = validity;
    data['data'] = this.data;
    data['price'] = price;
    return data;
  }
}

class Country {
  String? countryName;
  String? countryImage;
  String? countryCode;

  Country({this.countryName, this.countryImage, this.countryCode});

  Country.fromJson(Map<String, dynamic> json) {
    countryName = json['countryName'];
    countryImage = json['countryImage'];
    countryCode = json['countryCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['countryName'] = countryName;
    data['countryImage'] = countryImage;
    data['countryCode'] = countryCode;
    return data;
  }
}