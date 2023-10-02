import 'package:flutter/foundation.dart';
import 'package:study_case/cache/cache.dart';
import 'package:study_case/services/rest_data.dart';

class LoginController extends ChangeNotifier {
  RestDataSource _api = RestDataSource();

  bool isLoading = false;

  bool isError = false;

  String errorMessage = '';

  Future<bool> login(String email, String password) async {
    changeIsLoading();
    final _response = await _api.login(email: email, password: password);
    changeIsLoading();

    if (_response.statusCode == 200) {
      Cache().setString('token', _response.token!);
      isError = false;
      notifyListeners();
      return true;
    } else {
      errorMessage = _response.error!;
      isError = true;
      notifyListeners();
      return false;
    }
  }

  changeIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
