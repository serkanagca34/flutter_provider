import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_case/controller/login_controller.dart';

final loginProvider =
    ChangeNotifierProvider<LoginController>((ref) => LoginController());
