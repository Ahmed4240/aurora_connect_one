
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