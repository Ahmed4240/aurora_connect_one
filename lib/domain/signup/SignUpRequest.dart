class SignUpRequest {
  String? email;
  String? username;
  String? phone;

  SignUpRequest({
    this.email,
    this.username,
    this.phone,
  });

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['username'] = username;
    data['phone'] = phone;
    return data;
  }
}
