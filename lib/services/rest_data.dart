import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:study_case/model/user_list_model.dart';
import '../model/login_model.dart';

class RestDataSource {
  static const String _baseURL = 'https://reqres.in/';

  // Login Url
  static String _loginUrl = _baseURL + 'api/login';

  // User List Url
  static String _userListUrl = _baseURL + 'api/users';

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

  // User List
  Future<UserListModel> fetchUserList() async {
    var headers = {'Content-Type': 'application/json'};

    var request = http.Request('GET', Uri.parse(_userListUrl));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var responseBody = await response.stream.bytesToString();

    UserListModel userListResponse;

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('User List Response Success : ${responseBody}');
      userListResponse = UserListModel.fromJson(json.decode(responseBody));
    } else {
      print('User List Response Error : ${responseBody}');
      userListResponse = UserListModel.fromJson(json.decode(responseBody));
    }

    userListResponse.statusCode = response.statusCode;

    print('User List Response StatusCode : ${userListResponse.statusCode}');

    return userListResponse;
  }
}
