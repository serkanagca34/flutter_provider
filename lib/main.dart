import 'package:flutter/material.dart';
import 'package:study_case/cache/cache.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_case/view/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Cache().init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study Case',
      home: SplahsView(),
    );
  }
}
