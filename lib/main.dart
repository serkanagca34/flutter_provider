import 'package:flutter/material.dart';
import 'package:study_case/view/login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study Case',
      home: LoginView(),
    );
  }
}
