import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/login_model.dart';

class RestDataSource {
  static const String _baseURL = 'https://reqres.in/';

  // Login Url
  static String _loginUrl = _baseURL + 'api/login';

  // Login
  Future<LoginModel> login(
      {required String email, required String password}) async {
    var headers = {'Content-Type': 'application/json'};

    var request = http.Request('POST', Uri.parse(_loginUrl));
    request.body = json.encode({"email": email, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var responseBody = await response.stream.bytesToString();

    LoginModel loginResponse;

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('Login Response Success : ${responseBody}');
      loginResponse = LoginModel.fromJson(json.decode(responseBody));
    } else {
      print('Login Response Error : ${responseBody}');
      loginResponse = LoginModel.fromJson(json.decode(responseBody));
    }

    loginResponse.statusCode = response.statusCode;

    print('Login Response StatusCode : ${loginResponse.statusCode}');

    return loginResponse;
  }
}
