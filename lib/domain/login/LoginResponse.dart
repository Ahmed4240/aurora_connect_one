
class LoginResponse {
  bool? isSuccess;
  LoginResponseData? data;
  Error? error;

  LoginResponse({
    this.isSuccess,
    this.data,
    this.error,
  });


  LoginResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    data = json['data'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isSuccess'] = isSuccess;
    data['data'] = data;
    data['error'] = error;
    return data;
  }
}

class LoginResponseData {
  int? id;
  String? email;
  String? userId;
  String? firstName;
  String? lastName;
  String? accessToken;
  String? culture;

  LoginResponseData({
    this.id,
    this.email,
    this.userId,
    this.firstName,
    this.lastName,
    this.accessToken,
    this.culture,
  });

  LoginResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    accessToken = json['accessToken'];
    culture = json['culture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['userId'] = userId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['accessToken'] = accessToken;
    data['culture'] = culture;
    return data;
  }

}