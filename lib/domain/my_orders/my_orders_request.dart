import 'dart:convert';

import '../plans/PlanDetail.dart';
import '../error.dart';


class MyOrdersRequest {
  String? userId;

  MyOrdersRequest({
    this.userId,
  });

  MyOrdersRequest.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() => {
    "userId": userId,
  };
}
