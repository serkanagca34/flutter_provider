import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_case/controller/user_list_controller.dart';

final userListProvider =
    ChangeNotifierProvider<UserListController>((ref) => UserListController());
