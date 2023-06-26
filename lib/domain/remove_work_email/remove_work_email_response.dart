import 'dart:convert';
import '../error.dart';


RemoveWorkEmailResponse getRemoveEmailInformationResponse(String str) => RemoveWorkEmailResponse.fromJson(json.decode(str));
String getRemoveEmailInformationResponseString(RemoveWorkEmailResponse data) => json.encode(data.toJson());


class RemoveWorkEmailResponse {
  bool? isSuccess;
  bool? data;
  Error? error;

  RemoveWorkEmailResponse({
    this.isSuccess,
    this.data,
    this.error,
  });

  RemoveWorkEmailResponse.fromJson(Map<String, dynamic> json) {
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
