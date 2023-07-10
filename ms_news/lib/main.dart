import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:ms_news/shared/shared.dart';
import 'app_init.dart';
import 'app_widget.dart';

void main() async {
  await AppInit.init();

  runApp(
    ProviderScope(
      observers: [RiverpodLogger()],
      child: AppWidget(),
    ),
  );
}
