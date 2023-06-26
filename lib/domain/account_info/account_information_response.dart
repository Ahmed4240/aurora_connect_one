import 'dart:convert';
import '../error.dart';

AccountInformationResponse getAccountInformationResponse(String str) => AccountInformationResponse.fromJson(json.decode(str));
String getAccountInformationResponseString(AccountInformationResponse data) => json.encode(data.toJson());

class AccountInformationResponse {
  bool? isSuccess;
  AccountInformationData? data;
  Error? error;

  AccountInformationResponse({
    this.isSuccess,
    this.data,
    this.error,
  });

  AccountInformationResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    data = AccountInformationData.fromJson(json["data"]);
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

class AccountInformationData {
  String? userId;
  String? username;
  String? name;
  String? email;
  String? phone;
  String? workEmail;
  bool? isReceiptOnWorkEmail;

  AccountInformationData({
    this.userId,
    this.username,
    this.name,
    this.email,
    this.phone,
    this.workEmail,
    this.isReceiptOnWorkEmail,
  });

  AccountInformationData.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    workEmail = json['workEmail'];
    isReceiptOnWorkEmail = json['isReceiptOnWorkEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['username'] = username;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['workEmail'] = workEmail;
    data['isReceiptOnWorkEmail'] = isReceiptOnWorkEmail;
    return data;
  }
}