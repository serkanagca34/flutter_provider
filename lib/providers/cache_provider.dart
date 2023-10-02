import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_case/cache/cache.dart';

final cacheProvider = Provider<Cache>((ref) {
  final cache = Cache();
  cache.init();
  return cache;
});
