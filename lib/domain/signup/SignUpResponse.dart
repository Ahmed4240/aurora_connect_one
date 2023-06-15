
import 'dart:convert';

SignUpResponse getSignUpResponse(String str) => SignUpResponse.fromJson(json.decode(str));
String getSignUpResponseString(SignUpResponse data) => json.encode(data.toJson());

class SignUpResponse {
  bool? isSuccess;
  SignUpResponseData? data;
  Error? error;

  SignUpResponse({
    this.isSuccess,
    this.data,
    this.error,
  });


  SignUpResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    data = SignUpResponseData.fromJson(json["data"]);
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

class SignUpResponseData {
  int? id;
  String? userId;
  String? token;

  SignUpResponseData({
    this.id,
    this.userId,
    this.token,
  });

  SignUpResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['token'] = token;
    return data;
  }

}