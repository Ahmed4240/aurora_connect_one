import 'dart:convert';
import '../error.dart';


DeleteMyAccountResponse getDeleteMyAccountResponse(String str) => DeleteMyAccountResponse.fromJson(json.decode(str));
String getDeleteMyAccountResponseString(DeleteMyAccountResponse data) => json.encode(data.toJson());


class DeleteMyAccountResponse {
  bool? isSuccess;
  bool? data;
  Error? error;

  DeleteMyAccountResponse({
    this.isSuccess,
    this.data,
    this.error,
  });

  DeleteMyAccountResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    data = json["data"];
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
