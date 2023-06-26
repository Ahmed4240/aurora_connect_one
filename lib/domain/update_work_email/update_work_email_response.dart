import 'dart:convert';
import '../error.dart';


UpdateWorkEmailResponse getUpdateEmailInformationResponse(String str) => UpdateWorkEmailResponse.fromJson(json.decode(str));
String getUpdateEmailInformationResponseString(UpdateWorkEmailResponse data) => json.encode(data.toJson());


class UpdateWorkEmailResponse {
  bool? isSuccess;
  bool? data;
  Error? error;

  UpdateWorkEmailResponse({
    this.isSuccess,
    this.data,
    this.error,
  });

  UpdateWorkEmailResponse.fromJson(Map<String, dynamic> json) {
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
