import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:ms_news/shared/shared.dart';

final msNewsDioProvider = Provider<Dio>((ref) {
  return DioClient().instance;
});
