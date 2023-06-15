
class ConfirmOrderRequest {
  String? orderId;
  String? userId;

  ConfirmOrderRequest({this.orderId, this.userId});

  ConfirmOrderRequest.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderId'] = orderId;
    data['userId'] = userId;
    return data;
  }
}
