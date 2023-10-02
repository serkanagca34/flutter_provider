import 'package:flutter/foundation.dart';
import 'package:study_case/model/user_list_model.dart';
import 'package:study_case/services/rest_data.dart';

class UserListController extends ChangeNotifier {
  RestDataSource _api = RestDataSource();

  bool isLoading = false;

  bool isError = false;

  List<Data> userList = [];

  Future<bool> getUserList() async {
    changeIsLoading();
    final _response = await _api.fetchUserList();
    changeIsLoading();

    if (_response.statusCode == 200) {
      userList = _response.data!;
      isError = false;
      notifyListeners();
      return true;
    } else {
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
