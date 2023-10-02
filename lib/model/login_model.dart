class LoginModel {
  String? token;
  String? error;
  int? statusCode;

  LoginModel({this.token, this.error, this.statusCode});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    error = json['error'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['error'] = this.error;
    data['statusCode'] = this.statusCode;
    return data;
  }
}
